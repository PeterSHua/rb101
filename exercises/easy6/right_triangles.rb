# input: positive integer
# outpt: triangle with length, width 5

# index = 1
# loop n times for each row
#   print (n - index) spaces
#   print index asterix

# R justified
#   0 to (num - 1) space, asterix

# L justified
#   0 to (num - 1) asterix, space

# Upsidedown R justified
#   (num - 1) to 0 space, asterix

# Upsidedown L jusitifed
#   (num - 1) to 0 asterix, space

require "pry"

def triangle(num, justify = 'r', orient = 'u')
  first_char, second_char, first_offset, second_offset = ' ', '*', -1, 1 if justify == 'r'
  first_char, second_char, first_offset, second_offset  = '*', ' ', 0, 0 if justify == 'l'

  num.times { |i| puts (first_char * (num - i - first_offset) + second_char * (i + second_offset)) } if orient == 'u'
  (num - 1).downto(0) { |i| puts (first_char * (num - i - first_offset) + second_char * (i + second_offset)) } if orient =='d'
end

puts '-----------------------'
triangle(4, 'r', 'u')
puts '-----------------------'
triangle(9, 'r', 'd')
puts '-----------------------'
triangle(5, 'l', 'u')
puts '-----------------------'
triangle(7, 'l', 'd')
