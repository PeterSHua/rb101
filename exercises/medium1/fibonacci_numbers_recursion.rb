=begin
Input: n
Output: nth fibonacci number

f(1) = 1
f(2) = 1
f(3) = f(1) + f(0) -> 2
f(4) = f(2) + f(1) -> 3
=end

def fibonacci(n)
  if n == 1 || n == 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
