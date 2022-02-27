=begin
input: string of word seperated by spaces
output: string with first and last of every word swapped

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Iterate through each word
  Swap first and last letter

Split the sentence into an array of words
For each word
  Swap first and last letter
=end
require 'pry'

def swap(str)
  arr = str.split(' ')
  arr.each do |word|
    first = word[0]
    word[0] = word[word.length - 1]
    word[word.length - 1] = first
  end
  arr.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
