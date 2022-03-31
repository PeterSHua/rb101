require "pry"

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power(num, n)
  mem = num
  (n-1).times do
    mem = multiply(mem, num)
  end
  mem
end

puts square(5) == 25
puts square(-8) == 64

=begin
Iteratative

def power(num, n)
  result = num

  (n-1).times do
    result = multiply(result, num)
  end

  result
end

puts power(2, 3) #== 8
puts power(-3, 4) #== 81
-------------------------------------------------------------------------------
Recursive

def power(num, n)
  n == 0 ? 1 : multiply(power(num, n - 1), num)
end
=end

# Tail Recursive
def power(num, n, mem)
  return 1 if n == 0
  return mem if n == 1

  power(num, n - 1, multiply(mem, num))
end


puts power(5, 0, 5) == 1
puts power(2, 3, 2) == 8
puts power(-3, 4, -3) == 81
