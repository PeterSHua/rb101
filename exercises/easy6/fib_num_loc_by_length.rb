# input: number of digits
# output: index of fibonacci number with input number of digits

# input >= 2
# fibonacci seq starts with 1, 1
# fibonacci seq starts at index 1

# Create a fibonacci array, initialized as [1, 1]
# Loop
#   Calculate the next number -> previous two number summed
#   Check the number of digits in the calculated number
#   If number of digits equal to input
#     Return the index + 1

def find_fibonacci_index_by_length(length)
  idx = 2
  fib = [1, 1]
  loop do
    num = fib[idx - 1] + fib[idx - 2]
    return (idx + 1) if num.digits.size == length
    fib << num
    idx += 1
  end
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
