=begin
input: count integer, start number integer
output: array of count length, values are multiples of start number

count >= 0
count == 0, output empty array

create empty output array
iterate 1..count
  append start * index to output array
return output array
=end

def sequence(count, start)
  (1..count).map { |idx| start * idx }
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
