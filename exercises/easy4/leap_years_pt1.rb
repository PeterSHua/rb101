=begin
input: year
output: if year is leap year

if year % 4 == 0
  if year % 100 == 0
    if year % 400 == 0
      it's a leap year
    else
      it's not
  else
    it's a leap year
else
  it's not
=end

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# Further exploration
# Sample code will fail when year is divisible by 400. If a number is divisible by 400, it must be divisible by 100. 
