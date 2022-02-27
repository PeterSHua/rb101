=begin
input: string
output: string with consecutive characters collapsed into one character

iterate through each char
  pop into output string if it's not the same as the last pop'd char
=end

# Original solution
=begin
def crunch(str)
  output = []
  str.chars.each { |c| output << c if output.last != c }
  output.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
=end
