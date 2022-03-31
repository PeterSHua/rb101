=begin
Input: n
Output: nth fibonacci number

1, 1, 2, 3, 5  8
1  2  3  4  5  6

Return 1 if n == 1 || n ==  2

Prev = 1
Curr = 1

Iterate (n - 2) times
  Prev, Curr = Curr, (Prev + Curr) % 10
End

Return Current

=end

def fibonacci_last(n)
  prev, curr = 1, 1

 (n - 2).times do
    prev, curr = curr, prev + curr
    curr = curr.digits.first
 end

 curr
end

def fibonacci_seq(n)
  return [1] if n == 1

  prev = 1
  curr = 1
  seq = [prev, curr]

  (n - 2).times do
    prev, curr = curr, (prev + curr) % 10
    seq << curr
  end

  seq
end

=begin
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
=end

=begin
Input: Array of numbers
Output: Integer of how long a sequence of unknown length repeats in Input

                         v-Check Start
[1 2 9 8 5 3 2 1 2 9 6 | 1 2 9 8 5 3 2 1 2 9 6]
               FALSE+  REPITION

Checking = FALSE

Iterate Input and for each Number, Idx
  Next if Idx = 0

  If Checking == TRUE
    Return Check_Start If Pattern_Index == Check_Start

    If Number == Input[Pattern_Index]
      Pattern_Index++
    Else
      Checking == FALSE
    End
  Else
    If Number == Input.First
      Check_Start = Idx
      Pattern_Index = 1
      Checking = TRUE
    End
  End
End

Return nil
=end

def find_rep(input)
  checking = false
  pattern_idx = 0
  check_start = nil

  input.each_with_index do |num, idx|
    next if idx == 0

    if checking
      if num == input[pattern_idx]
        pattern_idx += 1
        return check_start if pattern_idx == check_start
      else
        checking = false
      end
    else
      if num == input.first
        check_start = idx
        pattern_idx = 1
        checking = true
      end
    end
  end

  nil
end

# p find_rep(fibonacci_seq(200))

=begin
Fibonacci last digit repeats every 60 numbers

Find the remainder of n % 60
Get the last digit of the remainder Fibonacci number
=end

def fibonacci_last_fast(n)
  remainder = n % 60

  fibonacci_seq(remainder).last
end

p fibonacci_last_fast(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last_fast(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last_fast(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last_fast(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last_fast(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last_fast(123456789) # -> 4
