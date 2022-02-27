=begin
input: string
output: new string with input consant characters doubled

consonant = /[a-df-hj-np-tv-z]/i
=end

def double_consonants(str)
  str.chars.map { |char| char =~ /[a-df-hj-np-tv-z]/i ? char * 2 : char }
  .join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
