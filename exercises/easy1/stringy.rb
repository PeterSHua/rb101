=begin
input: a positive integer
output: a string of '1' and '0' of length equal to the integer

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

iterate from 0 to input - 1
  - if index is even, concatenate 1 to string
	- else, concatenate 0 to string
=end

def stringy(integer, start=1)
	string = ''
	(0..integer-1).each do |i|
		i.even? ? string << '1' : string << '0'
	end
	string
end
	
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 1) == '101010101'
puts stringy(4, 0) == '0101'
puts stringy(7, 1) == '1010101'