def output
  return unless @output

  @output.rewind
  @output.read
end
