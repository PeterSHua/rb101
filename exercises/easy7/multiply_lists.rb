=begin
input: two arrays of numbers
output: new array, [arr1[idx] * arr2[idx]]
=end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |zipped| zipped.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
