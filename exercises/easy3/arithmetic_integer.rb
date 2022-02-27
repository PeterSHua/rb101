=begin
input: 2 positive integers
output: + - * / % **

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

Get two numbers from user
Calculate and print +
Calculate and print -
Calculate and print *
Calculate and print /
Calculate and print %
Calculate and print **
=end

OPS = [:+, :-, :&, :/, :%, :**]

nums = []
puts "==> Enter the first number:"
nums << gets.chomp.to_i
puts "==> Enter the second number:"
nums << gets.chomp.to_i

for op in OPS
  puts "==> #{nums[0]} #{op} #{nums[1]} = #{nums.inject(op)}"
end
