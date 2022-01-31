=begin
input: positive integer
output: sum of digits

add each digit into a sum

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

until input is 0
	divide input by 10
	add remainder to sum
	set input to result

=end

def sum(integer)
	sum = 0
	remainder = 0

	until integer == 0
		result = integer.divmod(10)
		integer = result[0]
		sum += result[1]
	end
	sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45