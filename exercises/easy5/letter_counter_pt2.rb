=begin
input: string with words seperated by space
output: hash. key = number of letters in word, value = count

implicit req: symbols are part of words

Split string by ' ' into array of words
For each word in array of words
  split word into char array
  for each char in word
    pop into scrubbed word if included in a-zA-Z
  Get the length of scrubbed word
  Increment hash[scrubbed word length] by 1
Return the hash
=end

def word_sizes(str)
  words = str.split(' ')
  h = Hash.new(0)
  for word in words
    h[word.gsub(/[^a-zA-Z]/, '').length] += 1
  end
  h
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
