# input: string
# output: new string with letters swapped case

#   create empty output string
#   split input string into array of chars
#   iterate each character in input string
#     append upcase character in output string if it's a lowercase char
#     append downcase character in output string if it's a uppercase char
#     else append character
#   return output string

def swapcase(input)
  output = input.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  output.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
