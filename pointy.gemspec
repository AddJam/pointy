# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pointy/version'

Gem::Specification.new do |spec|
  spec.name          = "pointy"
  spec.version       = Pointy::VERSION
  spec.authors       = ["Chris Sloey"]
  spec.email         = ["chris@addjam.com"]
  spec.summary       = %q{Uses Google Directions API to get a list of points between two locations.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/AddJam/pointy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty", "~> 0.13.1"
  spec.add_dependency "polylines", "~> 0.1.1"
end
