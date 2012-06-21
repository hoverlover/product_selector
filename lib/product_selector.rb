require "mongoid"
require "highline"

require "product_selector/cli"
require "product_selector/model"
require "product_selector/version"

Mongoid.logger.level = :info
Mongoid.load! "mongoid.yml"

module ProductSelector
end
