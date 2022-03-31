=begin
Input: Number
Output: Maximum rotation of input

Maximum rotation is rotating a number, where just rotation fixes the first n digits, and n increments from 0 each time a rotation occurs.

Convert input number to an array of digits
Index = 0
Loop the digits array until the last digit (idx == digits.length - 2)
  Rotate digits[Index..-1]
  Index++
Join maximum rotated digit array into a string
Convert maximum rotated number string to an int
Return maximum rotated number int
=end

def rotate_array(input)
  output_last = input.first
  ouput = []

  (1...input.length).to_a.each do |idx|
    ouput[idx - 1] = input[idx]
  end

  ouput << output_last
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars

  static_digits = digits[0...(digits.length - n)]
  rotate_digits = digits[(digits.length - n)..-1]

  result_digits = static_digits + rotate_array(rotate_digits)
  result_digits.join.to_i
end

def max_rotation(input)
  n = input.digits.length

  until n == 1
    input = rotate_rightmost_digits(input, n)
    n -= 1
  end

  input
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
