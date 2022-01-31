=begin
input: a string of one or more words
output: a string with words > 5 chars reversed

split the input into words
check the lenght of each word
if length >= 5 reverse the word
combine the words back into a string

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

=end

def reverse_words(input)
	input.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS