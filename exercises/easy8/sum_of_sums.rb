=begin
input: number array
output: number

input contains at least one number

create empty array of sums
iterate each input number
  add current number with sum of previous numbers (previous number)
  store current sum of previous numbers in array of sums
sum all elements of array of sums
=end

def sum_of_sums(arr)
  sums = [arr[0]]
  (1..arr.size - 1).each { |idx| sums << arr[idx] + sums[idx - 1] }
  sums.reduce(:+)
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
