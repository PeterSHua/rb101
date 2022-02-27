=begin
input: noun, verb, adjective, adverb (strings)
output: madlib string
=end

GRAMMAR = {
  noun: 'a',
  verb: 'a',
  adjective: 'an',
  adverb: 'an'
}

madlibs = {}

GRAMMAR.each do |particle, prefix|
  print "Enter #{prefix} #{particle}: "
  madlibs[particle] = gets.chomp
end

puts "Do you #{madlibs[:verb]} your #{madlibs[:adjective]} #{madlibs[:noun]} #{madlibs[:adverb]}? That's hilarious!"

