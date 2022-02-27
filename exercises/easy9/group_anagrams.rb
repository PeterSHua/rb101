=begin
input: array of words
output: print array of anagrams

hash = {
  sorted_word: [index]
}

iterate input array
  sort word and add to hash [:sorted_word] = index

iterate hash
  if hash value array length > 1
    iterate value array
      print input array[index]
=end

require "pry"

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

def find_anagrams(words)
  anagram_loc = Hash.new { |hash, key| hash[key] = [] }

  words.each_with_index do |word, idx|
    anagram_loc[word.chars.sort.join] << idx
  end

  anagrams = []
  anagram_loc.each_value do |word_locs|
    if word_locs.length > 1
      anagrams << word_locs.map do |word_loc|
        words[word_loc]
      end
    end
  end
  anagrams
end

puts find_anagrams(words).inspect

