=begin
input: array of integer 0..19
output: array of integers sorted by words of numbers

create an array of number word representation
create a hash where key is word, and the value is number
[zero, one, two, three ...]
convert the input array into a word array
sort the word array
convert the word array to a number array
=end

I_TO_S = %w(zero one two three four
            five six seven eight nine
            ten eleven twelve thirteen fourteen
            fifteen sixteen seventeen eighteen nineteen)

def generate_s_to_i()
  idx = -1
  I_TO_S.to_h do |item|
    idx += 1
    [item, idx]
  end
end

S_TO_I = generate_s_to_i

def alphabetic_number_sort(array_i)
  array_s = []
  array_i.each { |i| array_s << I_TO_S[i]}
  array_s.sort!
  array_s.map { |s| S_TO_I[s] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
