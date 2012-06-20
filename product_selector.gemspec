# -*- encoding: utf-8 -*-
require File.expand_path('../lib/product_selector/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["hoverlover"]
  gem.email         = ["hoverlover@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "product_selector"
  gem.require_paths = ["lib"]
  gem.version       = ProductSelector::VERSION

  gem.add_dependency 'mongo_mapper', '>=0.11.1'

  gem.add_development_dependency 'rspec', '>=2.10.0'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'turnip'
  gem.add_development_dependency 'fabrication'
end
