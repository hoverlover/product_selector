module ProductSelector
  class Category
    include MongoMapper::Document

    key :name

    one :survey, class_name: "ProductSelector::Survey"
  end
end
