=begin
output: odd numbers in 1..99

loop from 1 to 99
  check if current number is odd, print if it is
end
=end

# (1..99).each { |_| puts _ if _.odd? }

# Further Exploration

# 1.upto(99) { |_| puts _ if (_ % 2 == 1) }
