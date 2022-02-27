=begin
input: Length in meters, width in meters
output: area in meters^2 and feet^2

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

Get the length in m
Get the width in m
Multiple the length by width for area in m^2
Multiply area in m^2 by 10.7639^2 for area in ft^2


Original Problem Solution
-------------------------

METERSQ_TO_FEETSQ = 10.7639

puts "Enter the length of the room in meters:"
length_meter = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width_meter = gets.chomp.to_f
area_sqmeter = (length_meter*width_meter).round(2)
area_sqft = (area_sqmeter*METER_SQUARED_TO_FEET_SQUARED).round(2)

puts "The area of the room is #{area_sqmeter} square meters (#{area_sqft} square feet)."

=end

# Further Exploration Solution

FEETSQ_TO_INSQ = 144
INSQ_TO_CMSQ = 6.4516

puts "Enter the length of the room in feet:"
length_ft = gets.chomp.to_f
puts "Enter the width of the room in feet:"
width_ft = gets.chomp.to_f
area_sqft = (length_ft*width_ft).round(2)
area_sqin = (area_sqft*FEETSQ_TO_INSQ).round(2)
area_sqcm = (area_sqin*INSQ_TO_CMSQ).round(2)

puts "The area of the room is #{area_sqft} square feet (#{area_sqin} square inches, #{area_sqcm} square centimeters)."
