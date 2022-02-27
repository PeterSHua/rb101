# input: array
# output: the same array, with elements in reversed order

# mutating method

# Iterate through the array until index == (array size / 2) - 1
#  swap element at index with (array size - 1 - index)
#  increment index

def reverse!(list)
  idx = 0
  until idx > list.size / 2 - 1
    swap = list[idx]
    list[idx] = list[list.size - 1 - idx]
    list[list.size - 1 - idx] = swap
    idx += 1
  end
  list
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true
