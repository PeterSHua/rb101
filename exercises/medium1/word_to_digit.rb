=begin
Input: string
Output: string with numbers as words converted to digits

Store words to digits in hash:
{
  'zero' => '0',
  'one' => '1',
  ...
  'nine' => '9'
}

Iterate each key/value pair in the hash
  Perform a greedy sub with pattern = key and replacement = value

=end

require 'pry-byebug'

=begin
LOOKUP = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(input)
  output = input

  LOOKUP.each do |k, v|
    output = output.gsub(/\b#{k}\b/i, v)
    #binding.pry
  end

  output
end

puts word_to_digit('Please freight call me at five five five one two three four. Thanks.')
=end

=begin
Further Exploration

Split the input string by word boundary to get an array of words
Iterate the converted array and for each word
  Iterate the keys of the lookup table
    If the current key matches the current word (case insensitive)
      Append the current key's value into the result string
      Set flag that current word is a number to true
      Break
    End

  If flag was not set to true
    Append the current word to the result string
    Set flag to false
  End

  If the next word is a space && the next next word is a number word &&
    Current word is a number (flag)
    Skip to the next next word
  Else
    Continue to the next word
  End
End



Return the string
=end

LOOKUP = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def case_insensitive_has_key?(word)
  LOOKUP.keys.each do |key|
    return LOOKUP[key] if word.match?(/\A#{key}\z/i)
  end

  nil
end


def word_to_digit_extended(input)
  words = input.split(/\b/)
  converted_words = ''
  idx = 0

  while idx < words.length
    digit = case_insensitive_has_key?(words[idx])

    if digit
      converted_words << digit
      current_word_is_digit = true
    else
      converted_words << words[idx]
      current_word_is_digit = false
    end

    next_word_is_space = words[idx + 1] == ' '

    if (idx + 2) < words.length
      next_next_word_is_digit = case_insensitive_has_key?(words[idx + 2])
    end

    if current_word_is_digit && next_word_is_space && next_next_word_is_digit
      idx += 2
    else
      idx += 1
    end
  end

  converted_words.sub(/\b\d{10}\b/) { |match| to_phone_number(match) }
end

def to_phone_number(numbers)
  numbers = numbers.chars
  phone_number = '('

  3.times do
    phone_number << numbers.shift
  end

  phone_number += ') '

  3.times do
    phone_number << numbers.shift
  end

  phone_number += '-'

  4.times do
    phone_number << numbers.shift
  end

  phone_number
end

puts word_to_digit_extended('Please freight call me at 123, 1 2 3, FiVe fiVe fivE oNe TwO tHrEe fOuR. Thanks. Nine Fourty.')
puts word_to_digit_extended('Please call me at one two three four five six seven eight nine zero')
