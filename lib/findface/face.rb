module Findface
  class Face
    class << self

      # Endpoint: https://api.findface.pro/v0/faces/ (GET) | 
      # Usage:    FindFace::Face.list
      #           Output: Returns list of faces
      def list pages = nil
        Findface.get_list 'faces', pages
      end

      # Endpoint: https://api.findface.pro/v0/meta/ (GET) | 
      # Usage:    FindFace::Face.list_by_meta
      #           Output:  Returns list of faces with meta information
      def list_by_meta
        API::request(:get, 'meta')
      end

      # Endpoint: https://api.findface.pro/v0/face/ (POST) | 
      # Usage:    FindFace::Face.create
      #           Output: Creates a new face object
      def create options
        API::request(:post, 'face', options)
      end

      # Endpoint: https://api.findface.pro/v0/face/id/:id (GET) | 
      # Usage:    FindFace::Face.details(face_id)
      #           Output: Returns the details of a face with matching id
      def details face_id
        API::request(:get, "face/id/#{face_id}")
      end
      
      # Endpoint: https://api.findface.pro/v0/face/meta/:meta_string (GET) | 
      # Usage:    FindFace::Face.details_by_meta(meta_string)
      #           Output: Returns the details of an face with matching meta_string
      def details_by_meta meta_string, pages = nil
        Findface.get_list "face/meta/#{Findface.encode_meta_string(meta_string)}", pages
      end

      # Endpoint: https://api.findface.pro/v0/face/id/:id (PUT) | 
      # Usage:    FindFace::Face.update(face_id)
      #           Output: Updates a face with matching id
      def update face_id, options
        API::request(:put, "face/id/#{face_id}", options)
      end

      # Endpoint: https://api.findface.pro/v0/face/id/:id (DELETE) | 
      # Usage:    FindFace::Face.delete(face_id)
      #           Output: Deletes a face with matching id
      def delete face_id
        API::request(:delete, "face/id/#{face_id}")
      end

      # Endpoint: https://api.findface.pro/v0/face/meta/:meta_string (DELETE) | 
      # Usage:    FindFace::Face.delete_by_meta(meta_string)
      #           Output: Deletes a face with matching meta_string
      def delete_by_meta meta_string
        API::request(:delete, "face/meta/#{Findface.encode_meta_string(meta_string)}")
      end     
    end
  end
end
