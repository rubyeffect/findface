module Findface
  class API
    class << self

      # This is universal method that handles the process of communicating with API end points and returns a response or proper error message.
      # This is invoked from Endpoint methods by passing required parameters like 'method', 'uri' and 'options' as inputs
      def request method, uri, options={}
        options = Findface.token_auth.merge!({:body => options})
        uri = Findface.base_uri + uri 
        response = HTTParty.send(method, uri, options)
        if response.body == nil
          # A delete request simply returns HTTP 204 No Content as a response. Here specific response is created for delete requests to observe successful calls to endpoint
          # as unsuccessful delete requests always returns reason for request failure.
          return "Delete request executed successfully."
        else
          parsed_response = JSON.parse(response.body)
          if response.code.to_i == 200
            # Returns parsed_response - a hash of response body
            # if response is successful
            parsed_response
          else
            # Raises error if the response is not sucessful
            raise Findface::Error.new(parsed_response, response.code.to_i)
          end
        end
      end

    end
  end
end