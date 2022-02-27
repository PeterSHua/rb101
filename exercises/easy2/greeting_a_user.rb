=begin
input: name
output: Greet or screen at the user

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

Get the name
If name ends with '!', screem
Else greet

# My solution
print "What is your name? "
name = gets.chomp
puts name.end_with?('!') ? "HELLO #{name.chomp('!')}. WHY ARE WE SCREAMING?" : "Hello #{name}"
=end

=begin
#Futher exploration using chomp

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chomp('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
=end

#Further exploration using chop
print 'What is your name? '
name = gets.chop

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
