=begin
Input: lengths of triangle sides
Output: triangle type, or invalid

Sort lengths from shortest to longest into a length array

If two shortest <= longest
  Return Invalid
Elsif Length array only has 1 unique element
  Return equilateral
Elsif Length array has 2 unique elements
  Return Isosceles
Else
  Return Scalene
End
=end

def triangle(len1, len2, len3)
  lengths = [len1, len2, len3].sort

  if (lengths[0] + lengths[1]) <= lengths[2]
    :invalid
  elsif lengths.uniq.count == 1
    :equilateral
  elsif lengths.uniq.count == 2
    :isosceles
  else
    :scalene
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
