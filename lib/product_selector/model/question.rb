class Question
  include Mongoid::Document

  field :text

  embeds_one :answer
  embedded_in :survey
end
