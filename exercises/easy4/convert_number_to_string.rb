=begin
input: 0 or positive integer
output: string representation

Iterate through each digit
Remove the last digit

Iterate until number is 0
  digit = number % 10
  Add digit to front of char array
  number = number / 10
=end

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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
