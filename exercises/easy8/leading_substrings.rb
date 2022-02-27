=begin
input: string
output: array of substrings

substrings start with input string's first character
substrings ordered shortest to longest

create an empty array
iterate each character in input string
  get all characters from input string beginning to current character
  append substring into array
return substring array
=end

def leading_substrings(str)
  letters = str.chars
  sub_str = []
  1.upto(letters.length) do |idx|
    sub_str << letters.slice(0, idx).join
  end
  sub_str
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
