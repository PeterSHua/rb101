=begin
century = year / 100 + 1 if year % 100 != 0
=end
require "pry"
ORDINALS = %w(st nd rd th)

def century(year)
  result = (year / 100)
  result += 1 if year % 100 != 0
  result = result.to_s

  return result + ORDINALS[3] if result[-2] == '1'

  case result[-1]
  when '1'
    return result + ORDINALS[0]
  when '2'
    return result + ORDINALS[1]
  when '3'
    return result + ORDINALS[2]
  else
    return result + ORDINALS[3]
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

puts century(2000)
puts century(2001)
puts century(1965)
puts century(256)
puts century(5)
puts century(10103)
puts century(1052)
puts century(1127)
puts century(11201)
