# input: array, obj
# output: boolean, if obj is in array

# obj can be of any type
# arrays may be empty

# iterate through the array
#   return true if current element == obj
# return false

def include?(arr, obj)
  arr.each { |ele| return true if ele == obj }
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
