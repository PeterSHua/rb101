=begin
Input: Number, n
Output: Number with the last n digits rotated (shift left)

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

If rotating 1 digit, output == input
n is <= numer of digits in Number

Convert the number to a string
Convert the string to an array of chars (digits)
Split the array of digits into two arrays, a static array and a array that will rotate
  - static: input[0...(input.length - n)]
  - rotate: input[(input.length - n)..-1]
Rotate the non-static array
Combine the static array and the rotated array
Join the array of digits into a string
Convert the string to an int
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

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
