module ProductSelector
  class User
    include MongoMapper::Document

    key :name

    many :answers, class_name: "ProductSelector::Answer"
  end
end
