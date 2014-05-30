# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-dribbble/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Adam Spooner']
  gem.email         = ['adamjspooner@gmail.com']
  gem.description   = %q{OmniAuth strategy for Dribbble.}
  gem.summary       = %q{OmniAuth strategy for Dribbble.}
  gem.homepage      = 'https://github.com/adamjspooner/omniauth-dribbble'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-dribbble'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Dribbble::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.14'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
