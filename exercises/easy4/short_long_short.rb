def short_long_short(str1, str2)
  if str1.length > str2.length
    long = str1
    short = str2
  else
    long = str2
    short = str1
  end
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
