=begin
input: a positive integer, boolean
output: 0 or half the integer

if boolean is true, output is half the integer, else 0

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

if boolean is true, return half the integer
else, return 0
=end

def calculate_bonus(int, bool)
	bool ? int/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000