=begin
input: string
output: whether the input string is a palindrome

Get user input
Reverse the input string
Does the reversed string match the input string?
=end

def palindrome?(str)
  str == str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# Further exploration

def arr_palindrome?(arr)
  arr == arr.reverse
end

puts arr_palindrome?([1, 2, 3]) == false
puts arr_palindrome?([1, 2, 2, 1]) == true

def generic_palindrome?(obj)
  obj == obj.reverse
end

puts generic_palindrome?('madam') == true
puts generic_palindrome?([1, 2, 2, 1]) == true

=begin
Iterate from 0 <= index < length/2
  Is collection[index] == collection[length - 1 - index]
  return false if unmatched pair
  index++
return true
=end


def iterate_palindrome?(obj)
  idx = 0
  while(idx < obj.length/2)
    return false if obj[idx] != obj[obj.length - 1 - idx]
    idx += 1
  end
  true
end

puts "Brute force"
puts iterate_palindrome?('madam') == true
puts iterate_palindrome?('Madam') == false
puts iterate_palindrome?([1, 2, 3]) == false
puts iterate_palindrome?([1, 2, 2, 1]) == true
