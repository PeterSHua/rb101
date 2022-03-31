=begin
input: string of digits
output: integer version of input

ouput = 0
exponent = 0
iterate through string back to front
  convert the current string digit to integer
  output += digit * 10 ^ (exponent)
  exponent++
=end

require 'pry-byebug'

CHAR_TO_INT = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def string_to_integer(str)
  binding.pry
  res = 0
  exp = 0
  (str.length-1).downto(0) do |idx|
    res += (CHAR_TO_INT[str[idx]]) * (10 ** exp)
    exp += 1
  end
  res
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

def hexadecimal_to_integer(str)
  digits = str.downcase.chars.map { |char| CHAR_TO_INT[char] }
  res = 0
  for digit in digits
    res = res * 16 + digit
  end
  res
end

puts hexadecimal_to_integer('4D9f') == 19871
