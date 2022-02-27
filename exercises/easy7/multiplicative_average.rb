=begin
input: array of integers
output: array of integers multipled together / size of array to 3 decimal places
=end

def show_multiplicative_average(input)
  puts format("%.3f", (input.inject(:*)/input.size.to_f))
end

puts show_multiplicative_average([3, 5])                # => The result is 7.500
puts show_multiplicative_average([6])                   # => The result is 6.000
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
