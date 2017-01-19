require "spec_helper"

describe Findface::Face do
  context "#list" do
    before(:all) do
      page_options = {
        next_page: "/v0/faces?max_id=FACE_ID (Integer)",
        prev_page: "/v0/faces?min_id=FACE_ID (Integer)"
      }
      @response = Findface::Face.list
      # ------ Listing faces using pagination parameters ------
      #@response = Findface::Face.list page_options
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

  context "#list_by_meta" do
    before(:all) do
      @response = Findface::Face.list_by_meta
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

  context "#create" do 
    before(:all) do 
      options = {
        meta: "Steve Jobs",
        photo: "http://www.adweek.com/agencyspy/wp-content/uploads/sites/7/2015/06/steve-jobs.jpg",
        galleries: ["default", "gal1", "gal2"]
      }
      @response = Findface::Face.create(options)
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have object #results' do
      expect(@response['results']).not_to be nil
    end
    it 'must have results as ARRAY' do
      expect(@response['results']).to be_instance_of(Array)
    end
    it 'must have an id' do
      expect(@response['results'][0]['id']).not_to be nil
    end
  end

  context "#details" do 
    before(:all) do 
      id = "FACE_ID (Integer)"
      @response = Findface::Face.details(id)
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have result as Hash' do
      expect(@response).to be_instance_of(Hash)
    end
    it 'must have an id' do
      expect(@response['id']).not_to be nil
    end
  end

  context "#details_by_meta" do 
    before(:all) do 
      meta_string = "Steve Jobs"
      page_options = {
        next_page: "/v0/faces?FACE_ID (Integer)",
        prev_page: "/v0/faces?FACE_ID (Integer)"
      }
      @response = Findface::Face.details_by_meta meta_string
      # ------ Listing details by meta using pagination parameters ------
      #@response = Findface::Face.details_by_meta meta_string, page_options
      
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have object #results' do
      expect(@response['results']).not_to be nil
    end
    it 'must have total results as 0 or more' do
      expect(@response['results'].length).to be >= 0
    end
    it 'must have results as ARRAY' do
      expect(@response['results']).to be_instance_of(Array)
    end
  end

  context "#update" do 
    before(:all) do 
      id = "FACE_ID (Integer)"
      options = {
        "meta": "Sam Berry #2"
      }
      @response = Findface::Face.update id, options
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have result as Hash' do
      expect(@response).to be_instance_of(Hash)
    end
    it 'must have an id' do
      expect(@response['id']).not_to be nil
    end
  end

  context "#delete" do 
    before(:all) do 
      id = "FACE_ID (Integer)"
      meta = "Sam Berry #2"
      @response = Findface::Face.delete id
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
  end

  context "#delete_by_meta" do 
    before(:all) do 
      meta_string = "Steve Jobs"
      @response = Findface::Face.delete_by_meta meta_string
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
  end

end
