$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "findface"
#Findface.api_key = ENV['FINDFACE_API_KEY'] 
Findface.api_key = '3DoSGoAs6zqo_f8-ipbRkm4ku7Br9d3t'

RSpec::Matchers.define :be_boolean do
  match do |actual|
    actual == true || actual == false
  end
end


