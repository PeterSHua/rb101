=begin
Input: string
Output: boolean

Output is true when parentheses in input are balanced
Balanced pairs start with (

Split input string into array of characters

balanced = 0

Iterate each character
  If balanced == 0 && character is ) then return false

  If character is ( then balanced++
  If character is ) then balanced--
End

Return true if balanced == 0

=end

PAIRS = %w( () [] {} "" '')

def balanced_pairs?(input, first, second)
  characters = input.chars
  balanced = 0

  if first == second
    return input.count(first).even?
  end

  characters.each do |character|
    return false if balanced.zero? && character == second

    balanced += 1 if character == first
    balanced -= 1 if character == second
  end

  balanced.zero?
end

def balanced?(input)
  PAIRS.each do |pair|
    return false if !balanced_pairs?(input, pair.chars.first, pair.chars.last)
  end

  true
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('[ ]') == true
puts balanced?('[[ ]') == false
puts balanced?('[ ]]') == false
puts balanced?('] [') == false
puts balanced?('{ }') == true
puts balanced?('{{ }') == false
puts balanced?('{ }}') == false
puts balanced?('} {') == false
puts balanced?('" "') == true
puts balanced?('"" "') == false
puts balanced?('" ""') == false
puts balanced?('" "') == true
