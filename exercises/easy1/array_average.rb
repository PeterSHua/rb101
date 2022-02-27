=begin
input: integer array
ouput: integer average of array elements

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

sum all the array elements / size of array
=end

def average(array)
	sum = 0
	for number in array
		sum += number
	end
	sum / array.size
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])