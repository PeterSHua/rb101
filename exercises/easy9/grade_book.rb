=begin
input: 3 numbers
output: letter grade string

output letter grade is determined by mean of input
0 <= input <= 100
=end

def get_grade(num1, num2, num3)
  mean = (num1 + num2 + num3) / 3
  case mean
    when 101.. then 'A+'
    when 90..100 then 'A'
    when 80..89 then 'B'
    when 70..79 then 'C'
    when 60..69 then 'D'
    when 0..59 then'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(999, 99, 9999) == 'A+'
