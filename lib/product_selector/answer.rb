class Answer
  include Mongoid::Document

  field :value

  embedded_in :question
end
