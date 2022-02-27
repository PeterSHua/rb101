def fizzbuzz(start, finish)
  (start..finish).each do |num|
    output = ''
    output << 'Fizz' if num % 3 == 0
    output << 'Buzz' if num % 5 == 0
    if output.empty?
      print num
    else
      print output
    end
    print ", " if num < finish
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
