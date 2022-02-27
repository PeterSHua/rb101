def multisum(num)
  multiples = []
  (1..num).each do |i|
    multiples << i if (i % 3).zero? || (i % 5).zero?
  end
  multiples.inject(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
