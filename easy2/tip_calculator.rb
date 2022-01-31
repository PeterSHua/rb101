=begin
input: bill amount, tip rate
output: tip, total amount

Get the bill amount
Get the tip rate
Output tip = bill amount*tip rate, total amount = bill amount + output tip

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_percent = gets.chomp.to_f/100

tip_amount = (bill * tip_percent)
total = (bill + tip_amount)

puts format("The tip is $%.2f", tip_amount)
puts format("The total is %.2f", total)
