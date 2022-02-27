# input: two arrays
# output: new array with unique elements of input arrays

# create empty output array
# iterate through first array
#   check if current element is in output array
#   add it to output array if it doesn't already exist
# iterate through second array
#   check if current element is in output array
#   add it to output array if it doesn't already exist

# input: array, array of unique values
# output: array of unique values

# iterate through array
#   check if current element is in unique array
#   add it to unique array if it doesn't already exist

def uniq(arr, unique_arr)
  arr.each { |ele| unique_arr << ele if !unique_arr.include?(ele)}
end

def merge(arr1, arr2)
  unique_arr = []
  uniq(arr1, unique_arr)
  uniq(arr2, unique_arr)
  unique_arr
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
