=begin
Input: n
Output: nth number in Fibonacci sequence

   pp p  c
pp p  c
1, 1, 2, 3, 5, 8, ...
1  2  3  4  5  6
=end

require 'pry-byebug'

def fibonacci(n)
  return 1 if n == 1 || n == 2

  c = 1
  p = 1

 (n - 2).times do
    p, pp = c, p
    c = pp + p
 end

 c
end

=begin
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501
=end

20.times do |num|
  puts "f(#{num}) = #{fibonacci(num)}"
end
