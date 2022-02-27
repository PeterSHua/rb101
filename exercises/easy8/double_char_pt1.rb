=begin
input: string
output: new string with each input string char doubled

iterate each input string character
  double the character

=end

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
