module ProductSelector
  class Question
    include MongoMapper::EmbeddedDocument

    key :text

    one :answer, class_name: "ProductSelector::Answer"
    belongs_to :survey, class_name: "ProductSelector::Survey"
  end
end
