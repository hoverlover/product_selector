module ProductSelector
  class Survey
    include MongoMapper::EmbeddedDocument

    many :questions, class_name: "ProductSelector::Question"
    belongs_to :category, class_name: "ProductSelector::Category"
  end
end
