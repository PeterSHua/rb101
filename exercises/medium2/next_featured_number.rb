=begin
Input: Integer
Output: Next featured number

Featured number
- Greater than input
- Odd
- Multiple of 7
- No repeated digits
- Maximum 9 digits

If input has 10 digits, return Error

Test = Input + 1

While Test has less than 10 digits
  If Test is odd && multiple of 7 && digits are unique
    Return Test
  Else
    Test++
  End
End

Return Error

=end

def featured(input)
  featured_num = input + 1

  while featured_num < 9876543210
    if featured_num.odd? &&
        featured_num % 7 == 0 &&
        featured_num.digits.uniq.length == featured_num.digits.length
      return featured_num
    end

    featured_num += 1
  end

  return 'Error: no next featured number'
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
