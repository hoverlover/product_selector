class Product
  include Mongoid::Document

  field :name
  field :color

  embedded_in :category
end
