require 'findface/all'

module Findface
  class << self
    # Returns API key or raises exception
    def api_key
      defined? @api_key and @api_key or raise "Findface.api_key not configured"
    end
    attr_writer :api_key

    # Sets the API endpoint base uri.
    # For each API request, the request specific element must be added excluding the common part of uri.
    # An example for entities is: base_uri + 'entities'
    def base_uri
      @base_uri = "https://api.findface.pro/v0/"
    end

    # Returns simple token based authentication hash.
    # While making a request, merge this hash into options hash of request.
    # We also need to merge request specific hash with key as body.
    # The overall format looks as follows:
    # {:headers => {:Authorization => 'Token YOUR_TOKEN'}}, :body => request_specific_options_hash}
    def token_auth
      {
        :headers => {
          :Authorization => "Token " + api_key
        }
      }
    end

    #Returns a string replacing a space with '%20'
    #Findface API do not accept strings with spaces or usage of '+' in the string.
    def encode_meta_string meta_string
      return meta_string.gsub(" ", "%20") if meta_string
    end

    #Gallery name cannot contain spaces.
    #This methods formats the string by eliminating spaces. 
    def format_gallery_name name_string
      return name_string.gsub(" ", '') if name_string
    end
    
    # Extensible method to manage & serve results considering pagination parameters supported by API.
    def get_list page_name, pages = nil
      next_page_url = pages[:next_page].split('?').last if !pages.nil? && !pages[:next_page].nil? && !pages[:next_page] != ''
      prev_page_url = pages[:prev_page].split('?').last if !pages.nil? && !pages[:prev_page].nil? && !pages[:prev_page] != ''
      if !next_page_url.nil? && prev_page_url.nil?
        API::request(:get, page_name + '?' +next_page_url)
      elsif next_page_url.nil? && !prev_page_url.nil?
        request_url = 
        API::request(:get, page_name + '?' + prev_page_url)
      elsif !next_page_url.nil? && !prev_page_url.nil?
        API::request(:get, page_name + '?' + next_page_url + '&' + prev_page_url)
      else
        #Regular request is executed if pages value is not present or contains invalid hash key names other than next_page & pev_page
        API::request(:get, page_name)
      end
    end
  end
end
