# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TimsLondon/version'

Gem::Specification.new do |spec|
  spec.name          = "TflApis"
  spec.version       = TflApis::VERSION
  spec.authors       = ["géraud"]
  spec.email         = ["mail@geraudmathe.com"]
  spec.description   = %q{This Gem aims to provide a wrapper for the TIMS}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
