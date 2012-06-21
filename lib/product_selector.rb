require "mongoid"
require "highline"

require "product_selector/model/answer"
require "product_selector/model/category"
require "product_selector/model/product"
require "product_selector/model/question"
require "product_selector/model/survey"

require "product_selector/cli"
require "product_selector/version"

Mongoid.logger.level = :info
Mongoid.load! "mongoid.yml"

module ProductSelector
      $stdin

      $stdout

      terminal = HighLine.new(input, output)


      category_choice = terminal.choose do |menu|
        categories.each do |category|
      question = survey.questions.create! text: "What is your favorite color #{category_choice}?"
      answer = terminal.ask question.text
      survey.save!

      terminal.say "Thanks for taking the survey!"
      matching_products = categories.detect { |c| c.name == category_choice }.products
                                                                             .map(&:name)
      if matching_products.empty?
end
