# -*- encoding: utf-8 -*-
require File.expand_path('../lib/product_selector/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["hoverlover"]
  gem.email         = ["hoverlover@gmail.com"]
  gem.description   = %q{Product selector}
  gem.summary       = %q{Product selector}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "product_selector"
  gem.require_paths = ["lib"]
  gem.version       = ProductSelector::VERSION

  gem.add_dependency 'mongoid', '2.4.11'
  gem.add_dependency 'bson', '1.6.2'
  gem.add_dependency 'highline', '1.6.13'

  gem.add_development_dependency 'fabrication', '2.0.2'
  gem.add_development_dependency 'rspec', '>=2.10.0'
  gem.add_development_dependency 'guard-bundler', '1.0.0'
  gem.add_development_dependency 'guard-rspec', '1.1.0'
  gem.add_development_dependency 'turnip', '1.0.0'
  gem.add_development_dependency 'database_cleaner', '0.7.2'
  gem.add_development_dependency 'pry-nav', '0.2.1'
end
