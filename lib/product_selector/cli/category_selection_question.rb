module ProductSelector
  class CategorySelectionQuestion < Question
    def ask
      categories = ::Category.all

      @terminal.choose do |menu|
        menu.prompt = "Please choose from one of the following categories:"

        categories.each do |category|
          menu.choice(category.name)
        end
      end
    end
  end
end
