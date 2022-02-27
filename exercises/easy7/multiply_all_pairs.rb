=begin
input: two arrays of numbers
output: new sorted array, the product of input array pairs

output is sorted by increasing value
output array can have duplicates

create empty output array
iterate items in array1
  iterate items in array2
    append array1 * array2
sort output array
return output array
=end

def multiply_all_pairs(arr1, arr2)
  output = []
  arr1.each do |ele_arr1|
    arr2.each { |ele_arr2| output << ele_arr1 * ele_arr2 }
  end
  output.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
