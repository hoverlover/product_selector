require "product_selector/version"
require "mongo_mapper"

module ProductSelector
end

MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "product_selector"
