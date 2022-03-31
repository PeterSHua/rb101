=begin
Input: number
Output: the max rotation of the input number

Max rotation results from:
  Shift left each digit
  Affix leftmost digit, shift left all others
  Affix leftmost 2 digits, shift left all others
  Affix leftmost 3 digits, shift left all others
  Continue until we've reached the second last digit

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

Convert the number into a string
Convert the string into an array of digits
Index = 0
Static = digits[0..Index]
Rotate = digits[Index..-1]

Rotate digits array
Loop until index == array length -2
  Static = digits[0..Index]
  Rotate = digits[Index..-1]
  digits = Static + Rotate
Join the digits array into a string
Convert the string to a int
---
input: array
output: array shifted left by one
rotate_array([1, 2, 3, 4]) == [2, 3, 4, 1]

Slice the input array from index 1 to -1
Append input array index to sliced array
=end

require 'pry-byebug'

def rotate_array(input)
  input[1..-1] << input[0]
end

def max_rotation(input)
  digits = input.to_s.chars

  0.upto(digits.length - 2) do |idx|
    digits = digits[0...idx] + rotate_array(digits[idx..-1])
  end

  digits.join.to_i
end

puts rotate_array([1, 2, 3, 4]) == [2, 3, 4, 1]
puts rotate_array([1]) == [1]
puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
