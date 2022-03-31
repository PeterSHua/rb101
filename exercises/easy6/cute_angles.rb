=begin
Input: Floating point angle
Output: String of angle in degs, mins, seconds

0 <= Input < 360
60 minutes/degree
60 seconds/minute

Minutes and Seconds are length 2 (pad with 0 if length 1)

Degrees = Input Rounded down
Minutes_float = (Input - Degrees) * 60
Minutes = Minutes_float Rounded down
Seconds_float = (Minutes_float - Minutes) * 60
Seconds = Seconds_float Rounded down

Print formatted string of angle
=end

MAX_DEG = 360
MIN_PER_DEGREE = 60
SEC_PER_MIN = 60
DEGREE = "\xC2\xB0"

def dms(deg_f)
  deg_f = deg_f % 360
  deg_f = MAX_DEG - deg_f if deg_f.negative?

  deg = deg_f.floor

  min_f = (deg_f - deg) * 60
  min = min_f.floor

  sec_f = (min_f - min) * 60
  sec = sec_f.floor

  puts "#{deg}#{DEGREE}#{format("%02d", min)}'#{format("%02d", sec)}\""
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")
