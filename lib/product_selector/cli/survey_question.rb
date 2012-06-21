module ProductSelector
  class SurveyQuestion < Question
    def initialize(terminal, category_choice)
      super terminal
      @category_choice = category_choice

      @survey = ::Survey.new
    end

    def ask
      question = @survey.questions.new text: "What is your favorite color #{@category_choice}?"

      answer = @terminal.ask question.text
      question.build_answer value: answer
      @survey.save!

      answer
    end
  end
end
