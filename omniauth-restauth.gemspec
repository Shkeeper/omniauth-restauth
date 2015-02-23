# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-restauth/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-restauth"
  gem.version       = Omniauth::Restauth::VERSION
  gem.authors       = ["Alex"]
  gem.email         = ["shkeeper@bigmir.net"]
  gem.summary       = %q{Testing new Strategy}
  gem.description   = %q{This is the testing source}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 3.1'
  gem.add_development_dependency 'rspec-its', '~> 1.0'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
end
