require "spec_helper"

describe Findface::Gallery do
  context "#list" do
    before(:all) do
      @response = Findface::Gallery.list
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
      @options = {"name": "TestGallery534"}
      @response = Findface::Gallery.create(@options)
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
    it 'must have result object as HASH' do
      expect(@response).to be_instance_of(Hash)
    end
    it 'must have result object with name provided' do
      expect(@response[:name]).to be == @options["name"]
    end
  end

  context "#delete" do 
    before(:all) do 
      name = "TestGallery4"
      @response = Findface::Gallery.delete name
    end
    it 'must return a response' do
      expect(@response).not_to be nil
    end
  end

end
