=begin
input: string of time in HH:MM format
output: minutes after, and before midnight 00:00

Extract hours and convert to minutes
Extract minutes
Minutes after midnight = Hours converted to minutes + minutes
Minutes before midnight = (Minutes in a day - Minutes after midnight) % minutes in a day
=end

# Original solution
=begin
HR_TO_MIN = 60
DAY_TO_HR = 24
DAY_TO_MIN = HR_TO_MIN  * DAY_TO_HR

def to_min(time)
  time.slice(0, 2).to_i * HR_TO_MIN + time.slice(3, 2).to_i
end

def after_midnight(time)
  to_min(time) % DAY_TO_MIN
end

def before_midnight(time)
  (DAY_TO_MIN - to_min(time)) % DAY_TO_MIN
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
=end

# Further Exploration
require 'time'

HR_TO_MIN = 60
DAY_TO_HR = 24
DAY_TO_MIN = HR_TO_MIN  * DAY_TO_HR

def after_midnight(time)
  now = Time.parse(time)
  (now.hour * HR_TO_MIN + now.min) % DAY_TO_MIN
end

def before_midnight(time)
  (DAY_TO_MIN - after_midnight(time)) % DAY_TO_MIN
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
