# input: array of strings
# output: array of strings with vowels removed

# remove a, A, e, E, i, I, o, O, u, U from strings
# vowels are case insensitive

# iterate through each string
#   iterate through each char
#     check if char is a vowel
#     remove from string

def remove_vowels(arr)
  arr.map do |ele|
    ele.delete 'aeiouAEIOU'
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
