module ProductSelector
  class Answer
    include MongoMapper::EmbeddedDocument

    key :value

    belongs_to :question, class_name: "ProductSelector::Question"
    belongs_to :user, class_name: "ProductSelector::User"
  end
end
