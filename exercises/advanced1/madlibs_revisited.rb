=begin
Input: Text file
Output: Text file contents with madlib replacements

Madlibs = {
  adjective: %w(quick lazy sleepy ugly)
  noun: %w(fox dog head leg)
  verb: %w(jumps lifts bites licks)
  adverb: %W(easily lazily noisily excitedly)
}

Read in file contents into a string variable File
Slip File into array of Words

Output = []
Iterate Words, for each word
  If Word matches %{adjective}
    Output << MADLIBS[:adjective]
  Elsif Word matches %{noun}
    Output << MADLIBS[:noun]
  Elsif Word matches %{verb}
    Output << MADLIBS[:verb]
  Elsif Word matches %{adverb}
    Output << MADLIBS[:adverb]
  Else
    Output << word
  End
End

Join Output into a string
Print Output
=end
require 'pry-byebug'

MADLIBS = {
  adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg),
  verb: %w(jumps lifts bites licks),
  adverb: %W(easily lazily noisily excitedly)
}

text = File.read('madlibs.txt')
words = text.split(' ')

output = words.map do |word|
  word.sub!(/%{adjective}/, MADLIBS[:adjective].sample)
  word.sub!(/%{noun}/, MADLIBS[:noun].sample)
  word.sub!(/%{verb}/, MADLIBS[:verb].sample)
  word.sub!(/%{adverb}/, MADLIBS[:adverb].sample)
  word
end.join (' ')

puts output
