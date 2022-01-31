=begin
Input: a positive integer
Output: an array of individual digits in the input

Split the input into individual digits
OR

Pop off the last digit of the input and store in the beginning of an array.
Repeat until input is empty.

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

Convert the integer to a string
Convert the string to an array of chars
For each char in the array, convert to an int

OR 

- input % 10 and add to end of array
- input = input / 10
- Stop when input is 0

=end

=begin

def digit_list(num)
	res = num.to_s.split('')
  res.map { |c| c.to_i }
end

=end

def digit_list(num)
	res = []
	until num == 0
		res << num % 10
		num /= 10
	end
	res.reverse!
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true