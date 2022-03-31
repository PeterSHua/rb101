=begin
Input: stray of commands seperated by space

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
Output:

Create empty Stack array
Create empty Register int

Split the input string into an array of Commands
Iterate the Command array
  If Command is an Integer
    Register = Command
  Elsif Command == 'PUSH'
    Stack << Register
  Elsif Command == 'ADD'
    Register = Stack.pop + Register
  Elsif Command == 'SUB'
    Register = Register - Stack.pop
  Elsif Command == 'MULTI'
    Register = Register * Stack.pop
  Elsif Command == 'DIV'
    Register = Register / Stack.pop
  Elsif Command == 'MOD'
    Register = Register % Stack.pop
  Elsif Command == 'POP'
    Register = Stack.pop
  Elsif Command == 'PRINT'
    puts Register
=end

require 'pry-byebug'

def minilang(tokens)
  return 'Invalid tokens' if tokens.empty?

  stack = []
  register = 0

  tokens = tokens.split(' ')

  tokens.each do |token|
    case token
    when 'PUSH'then stack << register
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else
      if token == token.to_i.to_s
        register = token.to_i
      else
        return 'Invalid tokens'
      end
    end
  end

  nil
end

=begin
minilang('PRINT')
# 0
puts

minilang('5 PUSH 3 MULT PRINT')
# 15
puts

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts

minilang('5 PUSH POP PRINT')
# 5
puts

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts

minilang('-3 PUSH 5 SUB PRINT')
# 8
puts

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
=end

=begin
Further Exploration
3
register = 3
stack = []

PUSH
register = 3
stack = [3]

5
register = 5
stack = [3]

MOD
register = 2
stack = []

PUSH
register = 2
stack = [2]

4
register = 4
stack = [2]

PUSH
register = 4
stack = [2, 4]

5
register = 5
stack = [2, 4]

MULTI
register = 20
stack = [2]

PUSH
register = 20
stack = [2, 20]

3
register = 3
stack = [2, 20]

ADD
register = 23
stack = [2]

PUSH
register = 23
stack = [2, 23]

7
register = 7
stack = [2, 23]

SUB
register = 16
stack = [2]

DIV
register = 8
STACK = []

PRINT
=end

minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH -7 ADD DIV PRINT')
puts minilang('')
puts minilang('FOO BAR')

=begin
3    []  3
PUSH [3] 3
5    [3] 5
MOD  [] 2
PUSH [2]
7    [2] 7
PUSH [2 7]
4    [2 7] 4
PUSH [2 7 4] 4
5    [2 7 4] 5
MULT [2 7] 20
PUSH [2 7 20]
3    [2 7 20] 3
ADD  [2 7] 23
SUB  [2] 16
DIV  [] 8
PRINT
=end
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
