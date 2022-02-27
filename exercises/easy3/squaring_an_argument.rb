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

def power(num, n)
  n == 0 ? 1 : multiply(power(num, n - 1), num)
end

puts square(5) == 25
puts square(-8) == 64
puts power(2, 3) == 8
puts power(-3, 4) == 81
