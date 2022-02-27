=begin
input: string
output: sum of ascii values

iterate through the string
  get ascii value of character
  sum the current ascii value
end
=end

def ascii_value(str)
  str.chars.inject(0) { |sum, char| char.ord + sum }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
