=begin

Inputs: a string, an integer
Output: printed string, integer times

Print the string integer times

repeat('Hello', 3)
=> Hello
=> Hello
=> Hello

repeat('foo', 2)
=> foo
=> foo

repeat('bar', 0)

repeat('', 4)

1. Loop input integer times
2. Print string

=end

def repeat(txt, num)
	num.times { puts txt }
end 

repeat('Hello',  3)
repeat('foo', 2)
repeat('bar', 0)
repeat('', 4)