=begin
input: number
output: number if it's a double number, number * 2 otherwise

double number when left digits match right digits
left digits are digits[0...length/2]
right digits are [length/2..-1]
=end

def twice(num)
  digits = num.to_s
  digits[0...digits.length/2] == digits[digits.length/2..-1] ? num : num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
