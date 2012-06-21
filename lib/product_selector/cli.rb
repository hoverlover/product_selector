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

      categories = Category.all

      category_choice = terminal.choose do |menu|
        menu.prompt = "Please choose from one of the following categories:"

        categories.each do |category|
          menu.choice(category.name)
        end
      end

      survey = Survey.new
      question = survey.questions.create! text: "What is your favorite color #{category_choice}?"

      answer = terminal.ask question.text
      question.create_answer value: answer
      survey.save!

      terminal.say "Thanks for taking the survey!"

      matching_products = categories.detect { |c| c.name == category_choice }.products
                                                                             .where(color: answer)
                                                                             .map(&:name)
      if matching_products.empty?
        terminal.say "Sorry, but no products matched that color."
      else
        terminal.say "Here are your matching products:"
        terminal.say terminal.list matching_products
      end
    end
  end
end