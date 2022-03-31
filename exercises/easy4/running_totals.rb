=begin
sum = 0
iterate the array
  total[i] = numbers[i] + sum
  sum = total[i]
=end

# Original answer
=begin
def running_total(numbers)
  sum = 0
  total = []
  0.upto(numbers.length-1) do |index|
    total[index] = numbers[index] + sum
    sum = total[index]
  end
  total
end
=end

# Further exploration with each_with_object
=begin
def running_total(numbers)
  numbers.each_with_object([]) { |num, total| total.empty? ? total << num : total << num + total.last }
end
=end

# Futher exploration with inject
require 'pry-byebug'

def running_total(numbers)
  binding.pry
  total = 0
  numbers.inject([]) { |arr, num| arr << total += num}
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
