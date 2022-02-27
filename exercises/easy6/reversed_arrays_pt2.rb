# input: array
# output: new array with input array objects reversed

# method is non-mutating

# create an empty array
# iterate input array from index (length - 1) to 0
#   output << input[idx]
#   increment index
# return new array

def reverse(list)
  output = []
  list.each { |ele| output.prepend(0) }
  output
  list.each_with_object([]) { |ele, output| }
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

puts list = [1, 3, 2]                      # => [1, 3, 2]
puts new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
