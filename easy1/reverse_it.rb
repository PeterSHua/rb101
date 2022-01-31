=begin
input: string
output: reverse the words in the string

requirement: multiple spaces reduce to one space

Starting at the start and end of the string, swap the word
Continue until the middle word of the string, or if the start position exceeds the end position

'Hello World' => 'World Hello'
'Reverse these words' == 'words these Reverse'

split the string into words, and store into an array
head = 0
tail = string length - 1
iterate the array until start >= end
  - swap value of start and end index
	- increment start, decrement end
iterate the array
  - add space + each array value to the string
=end

def reverse_sentence(input)
	output = input.split
	head = 0
	tail = output.length - 1
	until head >= tail do
		save = output[head]
		output[head] = output[tail]
		output[tail] = save
		head += 1
		tail -= 1
	end
	
	reversed = ''
	output.each do
		|word|
		reversed = "#{reversed} #{word}"
	end
	reversed.delete_prefix(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''