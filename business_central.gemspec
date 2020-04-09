# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'business_central/version'

Gem::Specification.new do |spec|
  spec.name          = "business_central"
  spec.version       = BusinessCentral::VERSION
  spec.authors       = ["Five Senses Coffee"]
  spec.email         = ["dev@fivesenses.com.au"]
  spec.summary       = %q{Interact with the Microsoft Dynamics365 Business Central API}
  spec.description       = %q{Interact with the Microsoft Dynamics365 Business Central API}
  spec.homepage      = "https://github.com/fivesenses/business_central"
  spec.license       = "Mozilla"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "oauth2"
  spec.add_development_dependency "bundler", "2.1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-cobertura"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "ci_reporter_test_unit"
end
