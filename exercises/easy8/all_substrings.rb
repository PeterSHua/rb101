=begin
input: string
output: array of all substrings

substring array ordered by index position in input string

create empty output array
interate input
  get all substrings of input[idx...input.length]
  append to output array
return output array
=end

def leading_substrings(str)
  (0...str.length).map { |idx| str[0..idx] }
end

def substrings(str)
  (0...str.length).map { |idx| leading_substrings(str[idx..-1]) }.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
