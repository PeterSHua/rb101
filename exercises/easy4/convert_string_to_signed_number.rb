CHAR_TO_INT = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def string_to_integer(str)
  res = 0
  exp = 0
  (str.length-1).downto(0) do |idx|
    res += (CHAR_TO_INT[str[idx]]) * (10 ** exp)
    exp += 1
  end
  res
end

# Original solution
=begin
def string_to_signed_integer(str)
  if str[0] == '-' || str[0] == '+'
    sign = str.slice!(0)
  else
    sign = '+'
  end

  num = string_to_integer(str)
  sign == '+' ? num : -1 * num
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
=end

# Further exploration

def string_to_signed_integer(string)
  sign = string.slice!(0) if ['+', '-'].include?(string[0])
  num = string_to_integer(string)
  sign == '-' ? num * -1 : num
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
