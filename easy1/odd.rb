=begin
input: integer (+/-/0)
output: true if input is odd

If 0 return false
If input % 2 is 0 then it's even

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

1. If input is 0, return false
2. If input % 2 is 0, return false
3. Else return true
=end

def is_odd?(num)
	false if num == 0
	num % 2 == 0 ? false : true
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true