=begin
Input: Text file
Output: Longest sentence in the file, number of words in longest sentence
=end

text = File.read('pg84.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

largest_sentence_punctuation = /#{largest_sentence}(\.|\?|!)/.match(text)

puts "#{largest_sentence_punctuation}"
puts "Containing #{number_of_words} words"
puts

paragraphs = text.split(/(\r\n){2,}/)
largest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
largest_paragraph = largest_paragraph.strip
number_of_words = largest_paragraph.split.size

puts "#{largest_paragraph}"
puts "Containing #{number_of_words} words"
puts

words = text.split(/(\.|\?|!)?\s/)
# Delete words that don't exclusively contain letters
# ! ( ) - : ; " ' , . ?

largest_word = words.max_by { |word| word.size }
number_of_letters = largest_word.length

puts "#{largest_word}"
puts "Containing #{number_of_letters} letters"

=begin
Input: Text file
Output: Print longest sentence and number of words in longest sentence

Sentences end with . ! ?
foo-bar is 1 word
-- is 1 word

Open the file

Tag each sentence end with a symbol ~
  gsub(/\.|\!|\?, "\1~")
Split sentence by ~ into array of sentences

Longest = ''

Iterate Sentences
  Split Sentence into array of Words seperated by ' '

  If Words.Length > Longest
    Longest = Words
  End
End

Print Longest.Join(' ')
Print Longest.Length

=end

f = File.read("pg84.txt")

sentences = f.gsub(/\.|\!|\?/) { |match| match + 'TAG' }.split(/TAG/)

longest = []

sentences.each do |sentence|
  words = sentence.split(' ')

  if words.length > longest.length
    longest = words
  end
end

=begin
puts "The longest sentence: #{longest.join(' ')}"
puts "It's length: #{longest.length} words"
puts
=end

=begin
Pargraphs end with \r\n\r\n

Split text by \r\n\r\n into Pargraphs

Longest = []

Iterate Paragraphs and for each Paragraph
  Split Pargraph into array of Words seperated by ' '

  If Words.Length > Longest.Length
    Longest = Words
  End
End

Join Longest paragraph into string
Print string and length of string
=end

paragraphs = f.split(/(\r\n){2,}/)

longest = []

paragraphs.each do |paragraph|
  words = paragraph.split(' ')

  if words.length > longest.length
    longest = words
  end
end

paragraph = longest.join(' ')

=begin
puts "The longest paragraph is: #{paragraph}"
puts "It's length is: #{longest.length} words"
puts
=end

=begin
Word alphabetic lowercase and capital between word boundaries

Split txt into Words

Longest = ""

Iterate Words and for each Word
  If Word.Length > Longest.Length
    Longest = Word
  End
End

Print Longest Word
Print Longest Word Length
=end

words = f.split(/\b/i)

longest = ""

words.each do |word|
  word.delete! "\s"
  if word.strip.length > longest.length
    longest = word
  end
end

puts "Longest word is: #{longest}"
puts "Longest word length: #{longest.length}"
