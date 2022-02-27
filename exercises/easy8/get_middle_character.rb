=begin
input: non-empty string
output: middle char(s)

output is middle char if input is odd length
output is middle 2 chars if input is even
=end

def center_of(str)
  str.length.odd? ? str[str.length/2] : str.slice(str.length/2 - 1, 2)
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
