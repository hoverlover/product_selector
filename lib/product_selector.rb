require "product_selector/version"
require "mongo_mapper"

require "product_selector/answer"
require "product_selector/category"
require "product_selector/question"
require "product_selector/survey"
require "product_selector/user"

module ProductSelector
end

MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "product_selector"
