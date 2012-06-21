require 'active_support'
require 'turnip/rspec'
require 'fabrication'
require 'pry'
require 'database_cleaner'

ENV['RACK_ENV'] = "test"

# Fabrication relies on String#singularize, which is included in ActiveSupport, but
# something is clobbering that method.  This is the reason for the following monkey patch.
class String
  def singularize
    ActiveSupport::Inflector.singularize(self)
  end
end

Dir.glob("spec/acceptance/steps/**/*steps.rb") { |f| load f, true }
require_relative 'support/helpers'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

require 'product_selector'
