require "spec_helper"

describe Findface::Utility do

  context "#detect" do 
    before(:all) do 
      options = { "photo": "http://static.findface.pro/sample.jpg"}
      @response = Findface::Utility.detect options
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have object #faces' do
      expect(@response['faces']).not_to be nil
    end
    it 'must have results as ARRAY' do
      expect(@response['faces']).to be_instance_of(Array)
    end
  end

  context "#verify" do 
    before(:all) do 
      options = {
        "photo1": "http://static.findface.pro/sample.jpg",
        "photo2": "http://static.findface.pro/sample.jpg"
      }
      @response = Findface::Utility.verify options
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have object #results' do
      expect(@response['results']).not_to be nil
    end
    it 'must have key #verified' do
      expect(@response['verified']).not_to be nil
    end
    it 'must have results as ARRAY' do
      expect(@response['results']).to be_instance_of(Array)
    end
  end

  context "#identify" do 
    before(:all) do 
      options = {
        "n": 10,
        "photo": "http://static.findface.pro/sample.jpg"
      }
      @response = Findface::Utility.identify options
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have object #results' do
      expect(@response['results']).not_to be nil
    end
    it 'must have results as Hash' do
      expect(@response['results']).to be_instance_of(Hash)
    end
  end

    context "#identify_in_gallery" do 
      before(:all) do 
        name = 'default'
        options = { "photo": "http://static.findface.pro/sample.jpg"}
        @response = Findface::Utility.identify_in_gallery name, options
      end
      it 'must return a response' do
        expect(@response).not_to be nil
      end
      it 'must have object #results' do
        expect(@response['results']).not_to be nil
      end
      it 'must have results as Hash' do
        expect(@response['results']).to be_instance_of(Hash)
      end
    end

    context "#list_faces_from_gallery" do
      before(:all) do
        gallery_name = "default"
        page_options = {
          next_page: "/v0/faces/gallery/default/?max_id=FACE_ID (Integer)",
          prev_page: "/v0/faces/gallery/default/?min_id=FACE_ID (Integer)",
        }
        @response = Findface::Utility.list_faces_from_gallery gallery_name
        # ------ Listing faces from a gallery using pagination parameters ------
        #@response = Findface::Utility.list_faces_from_gallery gallery_name, page_options
      end 
      it 'must have results in response' do
        expect(@response['results']).not_to be nil
      end
      it 'must have results as ARRAY' do
        expect(@response['results']).to be_instance_of(Array)
      end
      it 'must have total results as 0 or more' do
        expect(@response['results'].length).to be >= 0
      end
    end

    context "#list_faces_from_gallery_by_meta" do
      before(:all) do
        gallery_name = "default"
        meta_string = "Sample Image"
        page_options = {
          next_page: "/v0/faces/gallery/default/meta/Sample%20Image?max_id=FACE_ID (Integer)",
          prev_page: "/v0/faces/gallery/default/meta/Sample%20Image?min_id=FACE_ID (Integer)",
        }
        @response = Findface::Utility.list_faces_from_gallery_by_meta gallery_name, meta_string
        # ------ Listing faces from a gallery by meta using pagination parameters ------
        #@response = Findface::Utility.list_faces_from_gallery_by_meta gallery_name, meta_string, page_options
      end 
      it 'must have results in response' do
        expect(@response['results']).not_to be nil
      end
      it 'must have results as ARRAY' do
        expect(@response['results']).to be_instance_of(Array)
      end
      it 'must have total results as 0 or more' do
        expect(@response['results'].length).to be >= 0
      end
      
    end

    context "#list_meta_for_gallery" do
      before(:all) do
        gallery_name = "default"
        @response = Findface::Utility.list_meta_for_gallery gallery_name
      end 
      it 'must have results in response' do
        expect(@response['results']).not_to be nil
      end
      it 'must have results as ARRAY' do
        expect(@response['results']).to be_instance_of(Array)
      end
      it 'must have total results as 0 or more' do
        expect(@response['results'].length).to be >= 0
      end
    end

end
