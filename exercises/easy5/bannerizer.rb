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

=begin
Second Attempt

Input: String
Output: Print Banner

Corner Border
Edge Border
Edge Border with Text
Edge Border
Corner Border

Corner Border
PLUS + DASH + DASH * Input.length + DASH + PLUS

Edge Border
PIPE + SPACE + SPACE * Input.length + SPACE + PIPE

Edge Border with Text
PIPE + SPACE + Input + SPACE + PIPE
-------------------------------------------------------------------------------

require 'pry-byebug'

MAX_TEXT_LENGTH = 76

def print_corner(input)
  txt_length = input.length > MAX_TEXT_LENGTH ? MAX_TEXT_LENGTH : input.length

  puts "+-#{'-' * txt_length}-+"
end

def print_edge(input)
  txt_length = input.length > MAX_TEXT_LENGTH ? MAX_TEXT_LENGTH : input.length

  puts "| #{' ' * txt_length} |"
end

def print_line(txt_length, line)
  puts "| #{line}#{' ' * (txt_length - line.length)} |"
end

def print_word_multiline(word)
  remaining = word

  until remaining.length <= MAX_TEXT_LENGTH
    puts "| #{remaining[0..75]} |"
    remaining = remaining[76..]
  end

  remaining
end

def print_edge_text(input)
  words = input.split
  line = ''

  txt_length = input.length > MAX_TEXT_LENGTH ? MAX_TEXT_LENGTH : input.length

  words.each do |word|
    if line == ''
      remaining = print_word_multiline(word)
      line << remaining
    elsif line.length + 1 + word.length <= MAX_TEXT_LENGTH
      line << ' ' << word
    else
      print_line(txt_length, line)
      line = ''

      remaining = print_word_multiline(word)
      line << remaining
    end

    print_line(txt_length, line) if word == words.last
  end
end

def print_in_box(input)
  print_corner(input)
  print_edge(input)
  print_edge_text(input)
  print_edge(input)
  print_corner(input)
end

txt = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis ipsum id nisl egestas rhoncus vel sit amet lectus. Quisque nunc ligula, sodales vel tellus non, viverra viverra dui. Sed eu condimentum leo. Sed eget sem vel turpis congue pharetra. Maecenas varius, ex at iaculis rutrum, ex nibh faucibus turpis, non finibus leo enim at diam. Nullam porta gravida porta. Morbi mollis tellus hendrerit tellus luctus vulputate. Integer pretium nibh scelerisque tortor maximus tincidunt. Curabitur et urna eros. Sed porta odio nec nibh consectetur, posuere consequat felis interdum. Morbi vehicula libero nec urna sagittis, eu fermentum magna interdum. Fusce ut luctus est, ut condimentum tellus. Cras nisi diam, aliquam condimentum hendrerit cursus, luctus in neque. Quisque neque dui, finibus imperdiet neque a, varius vehicula libero. "
print_in_box(txt)

txt = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
print_in_box(txt)

txt = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
print_in_box(txt)

txt = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbb"
print_in_box(txt)

txt = "aaaa"
print_in_box(txt)

=end
