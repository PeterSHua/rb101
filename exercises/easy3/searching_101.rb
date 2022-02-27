=begin
input: 6 numbers
output: does the 6th number appear in the first 5?

Get 6 numbers from the user
Check 1st to 5th number if equal to 6th number
Print result

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

Loop until 6 numbers are entered
  Loop until user enters valid number
Iterate through 1st-5th number and check if == 6th number
=end

ORDINAL = %w(1st 2nd 3rd 4th 5th last)

def get_num(position)
  loop do
    puts "==> Enter the #{position} number:"
    num = gets.chomp
    begin
      num = Integer(num)
    rescue
      puts "==> Please enter a number"
      next
    end
    return num
  end
end

arr = []

for ordinal in ORDINAL
  arr << get_num(ordinal)
end

last = arr.pop

result = arr.include?(last) ? 'appears' : 'does not appear'

puts "The number #{last} #{result} in #{arr}"
