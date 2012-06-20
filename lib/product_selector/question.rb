module ProductSelector
  class Question
    include MongoMapper::Document

    key :text

    many :answers, class_name: "ProductSelector::Answer"
    belongs_to :survey, class_name: "ProductSelector::Survey"
  end
end
