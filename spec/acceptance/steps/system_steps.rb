step "I run the system" do
  # If there was no input given just provide something so $stdin isn't used and doesn't block.
  if @input.nil?
    ProductSelector.stub(:input).and_return(StringIO.new)
  end

  @output = StringIO.new
  ProductSelector.stub(:output).and_return(@output)

  begin
    ProductSelector.start
  rescue EOFError
    # Rescue EOFError for times when we are only testing parts of the menu system
  end
end

step "I am presented with the list of categories" do
  expected = []
  Category.all.each_with_index do |c, i|
    expected << "#{i + 1}. #{c.name}"
  end
  expected << "Please choose from one of the following categories:"

  output.should include expected.join("\n")
end

step "the following menu prompt responses:" do |table|
  @input = table.to_a.flatten.join("\n")
  ProductSelector.stub(:input).and_return(StringIO.new(@input))
end

step "I am presented with the proper survey" do
  output.should include "What is your favorite color Lamborghini?"
end

step "the survey results are saved to the database" do
  Survey.count.should == 1
  Survey.first.questions.first.answer.value.should == "black"
end
