$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "findface"
Findface.api_key = ENV['FINDFACE_API_KEY'] 

RSpec::Matchers.define :be_boolean do
  match do |actual|
    actual == true || actual == false
  end
end


