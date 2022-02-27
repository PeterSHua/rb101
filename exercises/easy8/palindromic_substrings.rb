=begin
input: string
output: array of palindromic substrings

output is ordered by where it appears in input
duplicate palindromes are included
case sensitive
substrings are length 2 or greater

get all substrings greater than length 1 from input string
append substring to output array if it's a palindrome

=end

def scrub(str)
  str.chars.select { |char| char if char =~ /[a-z0-9]/i }.join
end

def leading_substrings(str)
  (0...str.length).map { |idx| str[0..idx] }
end

def substrings(str)
  (0...str.length).map { |idx| leading_substrings(str[idx..-1]) }.flatten
end

=begin
input: string
output: boolean

iterate string from 0 to (length/2 - 1)
  check if string[idx] == string[length - 1 - idx]
  return false if not equal
return true
=end

def palindrome?(str)
  str.downcase == str.reverse.downcase
end

# get all substrings greater than length 1 from input string
# append substring to output array if it's a palindrome

def palindromes(str)
  substrings(scrub(str)).select do |substring|
    substring if substring.length > 1 && palindrome?(substring)
  end
end

p palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye')
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
