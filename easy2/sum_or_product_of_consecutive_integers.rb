=begin
input: integer
output: sum of integers between 1 and input, or product of integers between 1 and input

ex:
input = 5
output (sum) = 1 + 2 + 3 + 4 + 5 = 15

input = 6
output(product) = 1 * 2 * 3 * 4 * 5 * 6 = 720

Get the user input integer
Get the user choice (sum or product)
If user chose sum, calculate sum of integers between 1 and input
If user chose product, calculate product of integers between 1 and input
=end

# ---------------------
# My solution

=begin
puts ">> Please enter an integer greater than 0:"
max = 0
loop do
  begin
    max = Integer(gets.chomp)
  rescue
    puts '>> Please enter an integer'
    next
  end
  break if max > 0
end

puts ">> Enter 's' to computer the sum, 'p' to compute the product."
choice = ''
loop do
  choice = gets.chomp
  break if (choice == 's' || choice == 'p')
  puts ">> Please enter either 's' or 'p'"
end

output = 1
(2..max).each do |idx|
  if choice == 's'
    output += idx
  else
    output *= idx
  end
end

puts output
=end
# ---------------------

# ---------------------
# Further exploration
max = 0
loop do
  puts ">> Please enter an integer greater than 0:"
  begin
    max = Integer(gets.chomp)
  rescue
    next
  end
  break if max > 0
end

choice = ''
loop do
  puts ">> Enter 's' to computer the sum, 'p' to compute the product."
  choice = gets.chomp
  break if (choice == 's' || choice == 'p')
end

if choice == 's'
  puts (1..max).inject(:+)
else
  puts (1..max).inject(:*)
end
