=begin
input: string with words seperated by space
output: hash. key = number of letters in word, value = count

implicit req: symbols are part of words

Split string by ' ' into array of words
For each word in array of words
  Get the length of word
  Is word length in the hash?
    If so, increment the value
    If not, add it to the hash and initialize the value to 1
Return the hash
=end

def word_sizes(str)
  words = str.split(' ')
  h = {}
  for word in words
    wl = word.length
    h.key?(wl) ? h[wl] += 1 : h[wl] = 1
  end
  h
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
