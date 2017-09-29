require 'awesome_print'

def debugged_mutation_with(attributes)
  result = described_class.run(attributes)

  if result.errors && @debug
    puts "MUTATION ATTRIBUTES".yellow
    ap attributes
    puts "MUTATION ERRORS".red
    ap result.errors.message
  end
  result
end