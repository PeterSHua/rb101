=begin
input: string of words and non-alphabetic characters
output: scrub the input of non-alphabetic characters (replaced by space)

For each character, check if its alphabetic
  replace with ' ' if it isn't

Create an array of characters from a-z

for each character in string
  included in a-z character array?
    replace with ' ' if not
split the string by whitespace
join the string by ' '

=end

LETTERS = ('a'..'z').to_a

def cleanup(str)
  str_space = str.chars.map { |c| LETTERS.include?(c) ? c : ' '}
  res = ''
  str_space.each_index { |idx| res << str_space[idx] if !(str_space[idx] == ' ' && str_space[idx + 1] == ' ')}
  res
end

puts cleanup("---what's my +*& line?") == ' what s my line '
