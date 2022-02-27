=begin
input: user's name as a string
output: string with user's name (or Teddy if blank) and a random age between 20 and 200 inclusive

Get the name from the user
Check if name is empty, use Teddy
Print the user's name and a random age between 20 and 200 inclusive

=> Steve
=> Steve is 50 years old!

=>
=> Teddy is 183 years old!
=end

puts "Please enter your name"
input = gets.chomp
puts "#{input.empty? ? 'Teddy' : input} is #{rand(20..200)} years old!"
