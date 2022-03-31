=begin
Input: Array
Output: Sorted array

Split Array into Halves recursively until result array only has one element
Merge Halves recursively until result array only has one element

[6, 2, 7, 1, 4], 3
[[6, 2], [7, 1, 4]], 2
[[[6], [2]], [[7], [1, 4]]], 1
[[[6], [2]], [[7]], [[1], [4]]]], 0

=end
require 'pry-byebug'

def merge(arr1, arr2)
  arr1_idx = 0
  arr2_idx = 0
  output = []

  loop do
    if arr1[arr1_idx].nil?
      output = output + arr2[arr2_idx..]
      break
    elsif arr2[arr2_idx].nil?
      output = output + arr1[arr1_idx..]
      break
    else
      case (arr1[arr1_idx] <=> arr2[arr2_idx])
      when -1
        output << arr1[arr1_idx]
        arr1_idx += 1
      when 0
        output << arr1[arr1_idx] << arr2[arr2_idx]
        arr1_idx += 1
        arr2_idx += 1
      when 1
        output << arr2[arr2_idx]
        arr2_idx += 1
      end
    end
  end

  output
end

def merge_sort(arr)
  return arr if arr.length == 1

  merge(merge_sort(arr[0...arr.length/2]), merge_sort(arr[arr.length/2..]))
end

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
