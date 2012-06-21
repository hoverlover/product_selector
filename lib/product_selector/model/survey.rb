class Survey
  include Mongoid::Document

  embeds_many :questions
end
