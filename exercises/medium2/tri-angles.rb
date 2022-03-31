=begin
Input: Triangle angles
Output: Triangle type

invalid: all angles summed = 180, each angle > 0
right: one angle = 90
acute: each angle < 90
obtuse: one angle > 90
=end

def triangle(deg0, deg1, deg2)
  degrees = [deg0, deg1, deg2]

  if degrees.reduce(:+) != 180 || degrees.include?(0)
    :invalid
  elsif degrees.include?(90)
    :right
  elsif degrees.all? { |degree| degree < 90 }
    :acute
  elsif degrees.any? { |degree| degree > 90 }
    :obtuse
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
