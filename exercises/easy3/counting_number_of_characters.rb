=begin
input: word or multiple words
output: number of characters in the input

Please write word or multiple words: walk
There are 4 characters in "walk".

Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".

Get user input
Remove all whitespace
Print the length of the result
=end

print "Please write word or multiple words: "
input = gets.chomp
puts "There are #{input.delete(' ').length} characters in \"#{input}\""
