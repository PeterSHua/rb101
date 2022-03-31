=begin
Input: n
Output: (sum of n integers)^2 - (square of integers summed)
=end

def sum_square_difference(n)
  (1..n).to_a.reduce(:+)**2 - (1..n).to_a.map { |num| num**2 }.reduce(:+)
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
