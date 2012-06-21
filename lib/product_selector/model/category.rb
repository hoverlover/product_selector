class Category
  include Mongoid::Document

  field :name
  embeds_many :products
end
