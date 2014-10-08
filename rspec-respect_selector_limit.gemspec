# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/respect_selector_limit/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-respect_selector_limit"
  spec.version       = Rspec::RespectSelectorLimit::VERSION
  spec.authors       = ["Ryan Sonnek"]
  spec.email         = ["ryan@codecrate.com"]
  spec.summary       = %q{RSpec matcher for validating number of CSS selectors}
  spec.description   = %q{RSpec matcher ensures that CSS files do not break in Old IE}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rspec'
  spec.add_dependency 'css_parser'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
