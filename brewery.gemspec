# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brewery/version'

Gem::Specification.new do |spec|
  spec.name          = "brewery"
  spec.version       = Brewery::VERSION
  spec.authors       = ["Jesus Lopes"]
  spec.email         = ["jlopes@zigotto.com.br"]
  spec.description   = %q{Tools for Homebrewing}
  spec.summary       = %q{Tools for Homebrewing}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
