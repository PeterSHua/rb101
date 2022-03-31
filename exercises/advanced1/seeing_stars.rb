=begin
Input: Integer n, the grid size
Output: Print 8 point star

n is odd
n >= 7

Print Top half
  (n - 1)/2 rows
  Each row has 3 stars
  Spacing between stars
    Stars with (n - 3)/2
    Decreases by 1
    Until there's 0 spacing
    space = (n - 3)/2; space == 0; space-= 1

Print Middle
  n stars

Print Bottom half
  (n - 1)/2 rows
  Each row has 3 stars
  Spacing between stars
    Stars with 0
    Increases by 1
    Until there's (n - 3)/2
    space = 0; space == (n - 3)/2; space+= 1
=end

def print_middle_row(n)
  puts '*' * n
end

def row(n, space_count)
  puts "*#{' ' * space_count}*#{' ' * space_count}*".center(n)
end

def print_top_half(n)
  ((n - 3)/2).downto(0) do |space_count|
    row(n, space_count)
  end
end

def print_bottom_half(n)
  0.upto((n - 3)/2) do |space_count|
    row(n, space_count)
  end
end

def star(n)
  print_top_half(n)
  print_middle_row(n)
  print_bottom_half(n)
end

star(7)
puts
star(9)

=begin
Input: n
Output: Print circle with n diameter

     *




*    -    *
