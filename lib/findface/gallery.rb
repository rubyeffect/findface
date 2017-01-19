module Findface
  class Gallery
    class << self

      # Endpoint: https://api.findface.pro/v0/galleries/ (GET)  | 
      # Usage:    FindFace::Gallery.list
      #           Output: Returns list of galleries
      def list
        API::request(:get, 'galleries')
      end

      # Endpoint: https://api.findface.pro/v0/galleries/ (POST) | 
      # Usage:    FindFace::Gallery.create
      #           Output: Creates a new gallery
      def create(options)
        options[:name] = Findface.format_gallery_name options[:name]
        API::request(:post, 'galleries', options)
      end

      # Endpoint: https://api.findface.pro/v0/galleries/:name (DELETE) | 
      # Usage:    FindFace::Gallery.delete(name)
      #           Output: Deletes a gallery with matching gallery name
      def delete(name)
        API::request(:delete, "galleries/#{Findface.format_gallery_name name}")
      end 

    end
  end
end
