require "spec_helper"

describe Findface do
  it "has a version number" do
    expect(Findface::VERSION).not_to be nil
  end

  it 'has an api key' do
    expect(Findface.api_key).not_to be nil
  end

  it 'has a Base URI?' do 
    expect(Findface.base_uri).not_to be nil
  end

  it 'must have a #token_auth' do
    expect(Findface.token_auth).not_to be nil
  end

  it 'must have a hash for #token_auth' do
    expect(Findface.token_auth).to be_a_kind_of(Hash)
  end

  it 'must have a key called :headers for #token_auth' do
    expect(Findface.token_auth).to include(:headers)
  end

  it 'must have a key called :headers with value as a hash for #token_auth' do
    expect(Findface.token_auth).to include({:headers => be_a_kind_of(Hash)})
  end

  it 'must have a key called :Authorization with value as a string for #token_auth #headers' do
    expect(Findface.token_auth).to include({:headers => include({:Authorization => be_a_kind_of(String)})})
  end
end
