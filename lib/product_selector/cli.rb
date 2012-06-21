require 'product_selector/cli/question'
require 'product_selector/cli/category_selection_question'
require 'product_selector/cli/survey_question'

require 'optparse'

module ProductSelector
  class CLI
    def self.input
      $stdin
    end

    def self.output
      $stdout
    end

    def self.start
      @terminal = HighLine.new(input, output)

      admin? ? admin_path : product_selection_path
    end

    private

    def self.admin_path
      @terminal.choose do |menu|
        menu.choice("Remove product") do |command, _|
          remove_product_path
        end
        menu.choice("Display survey results") do |command, _|
          display_survey_results_path
        end
      end
    end

    def self.remove_product_path
      @terminal.choose do |menu|
        @terminal.say "Please select a category:"

        ::Category.all.each do |c|
          menu.choice(c.name) do |name, _|

            @terminal.choose do |menu|
              @terminal.say "Please select a product:"

              ::Category.where(name: name).first.products.each do |p|
                menu.choice("#{p.name} - #{p.color}") do |name, _|
                  p.destroy
                  @terminal.say "Deleted #{name}"
                end
              end
            end
          end
        end
      end
    end

    def self.display_survey_results_path
      # TODO: complete
    end

    def self.product_selection_path
      category_choice = CategorySelectionQuestion.new(@terminal).ask
      survey_answer = SurveyQuestion.new(@terminal, category_choice).ask

      @terminal.say "Thanks for taking the survey!"

      matching_products = ::Category.where(name: category_choice).first.products.where(color: survey_answer).map(&:name)

      if matching_products.empty?
        @terminal.say "Sorry, but no products matched that color."
      else
        @terminal.say "Here are your matching products:"
        @terminal.say @terminal.list matching_products
      end
    end

    def self.admin?
      options = {}
      OptionParser.new { |opts|
        opts.banner = "Usage: product_selector [options]"

        opts.on("-a", "admin") do |s|
          options[:admin] = true
        end
      }.parse!

      options[:admin]
    end
  end
end
