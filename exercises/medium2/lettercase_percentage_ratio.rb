=begin
Input: string
Output: hash

hash = {
  percent_lower:
  percent_upper:
  percent_neither:
}

Input contains at least one char

Split the string into array of chars

Lowercase sum = 0
Uppercase sum = 0
Neither sum = 0

Iterate chars, for each char
  If char is lowercase, increment lowercase sum
  If char is uppercase, increment uppercase sum
  Else increment neither sum
End

hash[percent_lower] = Lowercase sum / input.length
hash[percent_upper] = Uppercase sum / input.length
hash[percent_neither] = Neither sum / input.length

Return hash
=end

def letter_percentages(input)
  letters = input.chars

  lowercase_sum = 0
  uppercase_sum = 0
  neither_sum = 0

  letters.each do |letter|
    if /[a-z]/.match?(letter)
      lowercase_sum += 1
    elsif /[A-Z]/.match?(letter)
      uppercase_sum += 1
    else
      neither_sum += 1
    end
  end

  hash = {}

  hash[:lowercase] = (lowercase_sum.to_f / input.length * 100).round(1)
  hash[:uppercase] = (uppercase_sum.to_f / input.length * 100).round(1)
  hash[:neither] = (neither_sum.to_f / input.length * 100).round(1)

  hash
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
puts letter_percentages('abcdefGHI')
