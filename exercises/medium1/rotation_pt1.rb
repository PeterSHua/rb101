=begin
input: array
output: input array shifted left by one

- don't mutate the input
- if input has single element, output is the same as input

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

save input array first idx
create empty output array
iterate input array from idx 1 to (array.length - 1)
  output array[idx - 1] = input array[idx]
append input array first idx element in ouput array
return the output
=end

def rotate_array(input)
  output_last = input.first
  ouput = []

  (1...input.length).to_a.each do |idx|
    ouput[idx - 1] = input[idx]
  end

  ouput << output_last
end

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true
puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']


=begin
Further Exploration

input: string
output: string with chars shifted left by one

For example:
rotate_string("Hello World") == "ello WorldH"

Convert string into array of chars
Pass array of chars into rotate_array
Join rotated array of chars into string
Return rotated string
=end

def rotate_string(input)
  rotate_array(input.chars).join
end

puts rotate_string("Hello World") == "ello WorldH"

=begin
Further Exploration

Input: Integer
Output: Integer with digits shifted left by one

rotate_integer(1234) == 2341

Convert input int to array of digits
Pass array of digits into rotate_array
Join array of rotated digits into int
Return rotated int
=end

def rotate_int(input)
  rotate_array(input.to_s.chars).join.to_i
end

puts rotate_int(1234) == 2341
