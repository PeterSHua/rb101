=begin
input: string
output: next to last word from input string

words are split by space
input has at least 2 words

split input string into array of words
return index -2 from array of words
=end

=begin
def penultimate(str)
  str.split[-2]
end
=end

=begin
Further Exploration
input: string
output: string of middle words in input string

return the middle two elements if there are even elements in the array
return single word if 1 element in array
return empty string if 0 elements in array

split string into array of words
return string of words at index size/2 and size/2 - 1 if size is even
return word at index size/2 if size is odd

=end

require "pry"

def penultimate(str)
  return '' if str.empty?
  words = str.split
  middle = words[words.length/2]
  middle = middle.prepend(words[words.length/2 - 1], ' ') if words.length.even?
  middle
end

puts penultimate('') == ''
puts penultimate('foo') == 'foo'
puts penultimate('last word') == 'last word'
puts penultimate('Launch School is great!') == 'School is'
puts penultimate('Launch School is the best!') == 'is'
