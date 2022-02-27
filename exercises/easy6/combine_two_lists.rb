# input: two arrays
# output: interleaved array

# arrays are non empty and equal length
# interleaved array starts with first array

=begin
def interleave(arr1, arr2)
  inter_arra = []
  (arr1.length).times do |idx|
    inter_arra << arr1[idx]
    inter_arra << arr2[idx]
  end
  inter_arra
end
=end
require "pry"

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    binding.pry
    result << element << array2[index]
  end
  result
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
