# input: string
# output: new string

# output string is input string with every word capitalized
# words are split by blank characters

# split input string into array of words
# iterate through array of words
#   iterate through each char
#     capitalize if first character
#     lowercase otherwise
# join array of capitalized words with spaces between
# return resulting array

=begin
def word_cap(str)
  str.split.map { |word| word.capitalize }.join ' '
end
=end

# further exploration
=begin
def word_cap(str)
  result = str.split.map do |word|
    characters = word.chars.map.with_index do |char, idx|
      if (idx == 0 && char =~ /[a-z]/)
        (char.ord - 32).chr
      elsif (idx > 0 && char =~ /[A-Z]/)
        (char.ord + 32).chr
      else
        char
      end
    end
    word = characters.join
  end
  result.join(' ')
end
=end

# define an array containing a-z
# define an array containing A-Z
# split input string into array of words
# iterate through array of words
#   iterate through each char
#     if first character
#       get the index position of character in the a-z array
#       get the A-Z array value at index
#     else
#       get the index position of character in the A-Z array
#       get the a-z array value at index
#   join the characters into word
# join array of capitalized words with spaces between
# return resulting array

ALPHABET_L = ('a'..'z').to_a
ALPHABET_U = ('A'..'Z').to_a

def word_cap(str)
  words = str.split.map do |word|
    word_capitalized = word.chars.map.with_index do |char, idx|
      if idx == 0 && ALPHABET_L.include?(char)
        ALPHABET_U[ALPHABET_L.index(char)]
      elsif idx > 0 && ALPHABET_U.include?(char)
        ALPHABET_L[ALPHABET_U.index(char)]
      else
        char
      end
    end
    word_capitalized.join
  end
  words.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
