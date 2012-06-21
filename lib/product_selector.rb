require "mongoid"
require "product_selector/version"

require "product_selector/answer"
require "product_selector/category"
require "product_selector/question"
require "product_selector/survey"
require "product_selector/user"
Mongoid.logger.level = :info
Mongoid.load! "mongoid.yml"

module ProductSelector
end

