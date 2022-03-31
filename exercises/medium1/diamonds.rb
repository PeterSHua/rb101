=begin
def print_line(star_count, diamond_width)

Input: Number of Stars, N
Output: Print Stars in a Line of width N

Padding = (N - (Number of Stars)) / 2

Print Padding + Star * (Number of Stars) + Padding
=end

def print_line(star_count, diamond_width)
  padding = ' ' * ((diamond_width - star_count) / 2)

  if star_count == 1
    puts "#{padding}*#{padding}"
  else
    center = ' ' * (star_count - 2) if star_count >= 3
    puts "#{padding}*#{center}*#{padding}"
  end
end

=begin
Input: N odd integer
Output: Print N x N diamond

From 1 Star to (N - 1) Stars
  Print_Line(Star_Count, Diamond_Width)
End

Print_Line(Diamond_Width, Diamond_Width)

From (N - 1) Stars to 1 Star
  Print_Line(Star_Count, Diamond_Width)
End
=end

def diamond(diamond_width)
  1.upto(diamond_width - 1) do |star_count|
    print_line(star_count, diamond_width) if star_count.odd?
  end

  print_line(diamond_width, diamond_width)

  (diamond_width - 1).downto(1) do |star_count|
    print_line(star_count, diamond_width) if star_count.odd?
  end
end

diamond(1)
puts
diamond(3)
puts
diamond(9)
