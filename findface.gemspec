# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'findface/version'

Gem::Specification.new do |spec|
  spec.name          = "findface"
  spec.version       = Findface::VERSION
  spec.authors       = ["Sandeep Mallela a.k.a Sam"]
  spec.email         = ["opensource@rubyeffect.com", "sandeep@rubyeffect.com"]

  spec.summary       = %q{Ruby Gem for Findface API to use it in Ruby on Rails & Sinatra Applications}
  spec.description   = %q{Utility to use FindFace API Face Detection algorithms on media like photos}
  spec.homepage      = "http://blog.rubyeffect.com/category/findface/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  #Development Dependencies
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"

  # Runtime Dependencies
  spec.add_runtime_dependency 'httparty', '~> 0.14.0'
  spec.add_runtime_dependency 'json', '~> 2.0', '>= 2.0.2'

  #Documentation
  spec.add_runtime_dependency 'yard', '~> 0.9.8'

end
