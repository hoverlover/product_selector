require "mongoid"

require "product_selector/model/answer"
require "product_selector/model/category"
require "product_selector/model/product"
require "product_selector/model/question"
require "product_selector/model/survey"

require "product_selector/version"

Mongoid.logger.level = :info
Mongoid.load! "mongoid.yml"

module ProductSelector
end

