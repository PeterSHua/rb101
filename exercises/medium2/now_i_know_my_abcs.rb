=begin
Input: string
Output: boolean

Blocks have two letters
A block limits the word that can be spelled - must not contain both letters

Iterate the blocks, for each block
  Extract the two letters
  Check if both letters exist in the Input
    If so, return false
End

Return true
=end

require 'pry-byebug'

BLOCKS = %w(B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M)

def block_word?(input)
  BLOCKS.each do |block|
    c1 = block[0]
    c2 = block[-1]

    if input.upcase.count(c1 + c2) > 1
      return false
    end
  end

  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
puts block_word?('GONG') == false
