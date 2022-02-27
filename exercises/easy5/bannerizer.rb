=begin
1 '+' + '-' * (length of string + 2) + '+'
2 '|' + spaces * (length of string + 2) + '|'
3 '|' + string + '|'
4 '|' + spaces * (length of string + 2) + '|'
5 '+-' + (spaces * length of string) + '-+'
=end

MAX_TEXT_WIDTH = 76
SPACE_LENGTH = 1

def print_border(length)
  puts '+' + '-' * (length + 2) + '+'
end

def print_padding(length)
  puts '|' + ' ' * (length + 2) + '|'
end

def print_in_box(str)
  q, r = str.length.divmod(MAX_TEXT_WIDTH)
  length = str.length > MAX_TEXT_WIDTH ? MAX_TEXT_WIDTH : str.length
  print_border(length)
  print_padding(length)

  # split the string up into array of words
  # check if next word in the string added to the print buffer will equal the max length
  #  pop the word off the array and append it to print buffer, and print
  # elsif next word in the string added to the pring buffer will exceed max length
  #  print the buffer + (max length - buffer length) * ' '
  # else
  #  pop the word off the array and append it to print buffer with a ' '

  buffer = ''
  str.split(' ').each do |word|
    if word.length > MAX_TEXT_WIDTH
      q, r = word.length.divmod(MAX_TEXT_WIDTH)
      q.times do
        puts '| ' + word.slice!(0, MAX_TEXT_WIDTH) + ' |'
      end
      puts '| ' + word + ' ' * (MAX_TEXT_WIDTH - word.length) + ' |' if r != 0
    elsif buffer.length + SPACE_LENGTH + word.length < MAX_TEXT_WIDTH
      buffer = buffer.empty? ? word : "#{buffer} #{word}"
    else
      if buffer.length + SPACE_LENGTH + word.length == MAX_TEXT_WIDTH
        buffer = buffer + ' ' + word
        puts '| ' + buffer + ' |'
        buffer = ''
      else
        buffer = buffer + ' ' * (MAX_TEXT_WIDTH - buffer.length)
        puts '| ' + buffer + ' |'
        buffer = word
      end
    end
  end

  if str.length <= MAX_TEXT_WIDTH
    puts '| ' + buffer + ' |'
  else
    puts '| ' + buffer + ' ' * (MAX_TEXT_WIDTH - buffer.length) + ' |' if !buffer.empty?
  end

  print_padding(length)
  print_border(length)
end

long_text = <<-TXT.chomp
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
TXT

print_in_box('')
print_in_box('11111111111111111111111111111111111111111111111111111111111111111111111111111111')
print_in_box('Test one two three')
print_in_box('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor')
print_in_box(long_text)
