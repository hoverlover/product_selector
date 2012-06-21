require 'product_selector/cli/question'
require 'product_selector/cli/category_selection_question'
require 'product_selector/cli/survey_question'

module ProductSelector
  class CLI
    def self.input
      $stdin
    end

    def self.output
      $stdout
    end

    def self.start
      terminal = HighLine.new(input, output)

      category_choice = CategorySelectionQuestion.new(terminal).ask
      survey_answer = SurveyQuestion.new(terminal, category_choice).ask

      terminal.say "Thanks for taking the survey!"

      matching_products = ::Category.where(name: category_choice).first.products.where(color: survey_answer).map(&:name)

      if matching_products.empty?
        terminal.say "Sorry, but no products matched that color."
      else
        terminal.say "Here are your matching products:"
        terminal.say terminal.list matching_products
      end
    end
  end
end
