INT_TO_CHAR = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(num)
  str = ''
  loop do
    num, digit = num.divmod(10)
    str = INT_TO_CHAR[digit] + str
    break if num == 0
  end
  str
end

# Original solution
=begin
def signed_integer_to_string(num)
  sign = ''
  abs_num = num.abs
  sign = (num == abs_num ? '+' : '-') unless num == 0
  sign + integer_to_string(abs_num)
end
=end

def signed_integer_to_string(number)
  sign_int = 1
  case number <=> 0
  when -1
    sign_char = '-'
    sign_int = -1
  when +1
    sign_char = '+'
  else
    sign_char = ''
  end

  "#{sign_char}#{integer_to_string(number*sign_int)}"
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
