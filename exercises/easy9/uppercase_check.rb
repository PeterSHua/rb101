=begin
input: string
output: boolean

output is true if input alphabetic chars are uppercase
non-alphabetic chars are ignored
empty string is true

iterate input string chars
  next iteration if non-alphabetic
  return false if lowercase
return true
=end

def uppercase?(str)
  str.chars.each do |char|
    next if !(char =~ /[a-z]/i)
    return false if char =~ /[a-z]/
  end
  return true
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
