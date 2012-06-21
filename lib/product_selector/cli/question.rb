module ProductSelector
  class Question
    def initialize(terminal)
      @terminal = terminal
    end

    def present
      raise "#present method not implemented subclass"
    end
  end
end
