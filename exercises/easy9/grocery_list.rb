=begin
input: array of arrays [[fruit, count]]
output: array of fruits

create empty output array
iterate input array
  append fruit count times
return output array
=end

def buy_fruit(list)
  list.each_with_object([]) do |sub_array, output|
    sub_array.last.times do
      output << sub_array.first
    end
  end
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
