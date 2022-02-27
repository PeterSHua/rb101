=begin
input: integer
output: array of integers 1..input

if input < 0
countdown from 1 to input number

=end

def sequence(num)
  if num > 0
    (1..num).map { |idx| idx }
  else
    1.downto(num).map { |idx| idx }
  end
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(0) == [1, 0]
puts sequence(-3) == [1, 0, -1, -2 , -3]
