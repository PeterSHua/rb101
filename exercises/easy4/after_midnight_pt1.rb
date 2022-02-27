=begin
input: integer representing number of minutes before or after midnight
output: string in hh:mm

Calculate hours
Calculate minutes
if input number is negative
  hours = 24 + number
  minutes = 60 + number
Format the string
=end

# Original solution
=begin
def time_of_day(num)
  hr, min = num.divmod(60)
  hr = hr % 24
  format('%02d:%02d', hr, min)
end
=end

# Further Exploration
DAY_OF_WEEK = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

def time_of_day(num)
  t = Time.new(2022, 2, 6, 0, 0)
  t += num * 60
  format("#{DAY_OF_WEEK[t.wday]} %02d:%02d", t.hour, t.min)
end

puts time_of_day(-4231)

=begin
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
=end
