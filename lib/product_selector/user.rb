module ProductSelector
  class User
    include MongoMapper::EmbeddedDocument

    key :name

    many :answers, class_name: "ProductSelector::Answer"
  end
end
