require "pry"
=begin
input: array
output: array with values of input array even indicies
=end

# Original solution
=begin
def oddities(arr)
  idx = 0
  arr_odd = []
  until idx >= arr.length
    arr_odd << arr[idx]
    idx += 2
  end
  arr_odd
end

# Further exploration
=begin
def evenities(arr)
  idx = 1
  arr_even = []
  until idx >= arr.length
    arr_even << arr[idx]
    idx += 2
  end
  arr_even
end
=end

def oddities(arr)
  arr_odd = []
  arr.each_index { |index| arr_odd << arr[index] if index.even? }
  arr_odd
end

def evenities(arr)
  even = arr.select { |ele| arr.index(ele).odd? }
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts evenities([2, 3, 4, 5, 6]) == [3, 5]
puts evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evenities(['abc', 'def']) == ['def']
puts evenities([123]) == []
puts evenities([]) == []
