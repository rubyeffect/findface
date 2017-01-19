module Findface
  class Utility
    class << self

      # Endpoint: https://api.findface.pro/v0/detect/ (POST) | 
      # Usage:    FindFace::Utility.detect
      #           Output: A list of rectangles (bounding boxes) for the detected faces.
      def detect options
        API::request(:post, 'detect', options)
      end

      # Endpoint: https://api.findface.pro/v0/verify/ (POST) | 
      # Usage:    FindFace::Utility.verify
      #           Output: Binary verification result of two images provided.
      def verify options
        API::request(:post, 'verify', options)
      end

      # Endpoint: https://api.findface.pro/v0/identify/ (POST) | 
      # Usage:    FindFace::Utility.identify
      #           Output: A map with - Detected or provided face bounding boxes, as keys,
      #           Arrays of matching Face objects along with match confidence, as values.
      def identify options
        API::request(:post, 'identify', options)
      end
      
      # Endpoint: https://api.findface.pro/v0/faces/gallery/:galley_name/identify/ (POST) | 
      # Usage:    FindFace::Utility.identify_in_gallery
      #           Output: Same as identification alogorithm, but it is applied on datasets which belongs to particular gallery
      def identify_in_gallery name, options
        API::request(:post, "faces/gallery/#{name}/identify", options)
      end
      
      # Endpoint: https://api.findface.pro/v0/faces/gallery/:gallery_name/ (GET) | 
      # Usage:    FindFace::Utility.list_faces_from_gallery
      #           Output: Returns list of faces data which belongs to particular gallery
      def list_faces_from_gallery name, pages = nil
        Findface.get_list "faces/gallery/#{name}/", pages
      end

      # Endpoint: https://api.findface.pro/v0/face/gallery/:gallery_name/meta/:meta_string (GET) | 
      # Usage:    FindFace::Utility.list_faces_from_gallery_by_meta
      #           Output: Retuns list of faces which belongs to particular gallery by meta information provided
      def list_faces_from_gallery_by_meta name, meta_string, pages = nil
        Findface.get_list "faces/gallery/#{name}/meta/#{Findface.encode_meta_string(meta_string)}", pages
      end

      # Endpoint: https://api.findface.pro/v0/meta/gallery/:gallery_name/ (GET) | 
      # Usage:    FindFace::Utility.list_meta_for_gallery
      #           Output: Returns meta information of faces belongs to particular gallery
      def list_meta_for_gallery name
        API::request(:get, "meta/gallery/#{name}/")
      end

    end
  end
end
