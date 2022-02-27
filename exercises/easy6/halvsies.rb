# input: array
# output: nested array [[], []]

# middle element in odd input array goes in first output nested array
# always output nested array

# first array = slice(0, (array.size + 1) / 2))
# second array = slice((array.size + 1) / 2,  array.size - (array.size + 1) / 2)

def halvsies(arr)
  mid = (arr.size + 1) / 2
  [arr.slice(0, mid), arr.slice(mid, arr.size - mid)]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
