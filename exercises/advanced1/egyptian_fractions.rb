=begin
def egyptian
Input: Rational Number
Output: Array of denominators of Egyptian Fraction of Input

    1   1   1   1
2 = - + - + - + -
    1   2   3   6

    1  1/2  1/6

Output = []
Remainder = Input
Denominator = 1

Loop
  If 1/Denominator <= Remainder
    Output << Denominator
    Remainder = Remainder - 1/Denominator
  End

  Denominator++
While Remainder > 0

Return Output
=end

def egyptian(input)
  output = []
  remainder = input
  denom = 1

  loop do
    if Rational(1, denom) <= remainder
      output << denom
      remainder -= Rational(1, denom)
    end

    denom += 1

    break if remainder <= 0
  end

  output
end

puts egyptian(Rational(2, 1)) == [1, 2, 3, 6]
puts egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
puts egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

=begin
def unegyptian
Input: Array of denominators of Egyptian Fraction of Input
Output: Rational Number

Sum = 0

Iterate Input and for each Denominator
  Sum = Sum + 1/Denominator
End

Return Sum as Rational

=end

def unegyptian(input)
  input.map { |denom| Rational(1, denom) }.reduce(:+)
end

puts unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
puts unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
puts unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
puts unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
puts unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
puts unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
puts unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
puts unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
