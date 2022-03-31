=begin
Input: 3 x 3 matrix
Output: transpose of 3 x 3 matrix

Matrix:
1  5  8
4  7  2
3  9  6

Transposed:
1  4  3
5  7  9
8  2  6

row, col = col, row

Create new Output 3 x 3 matrix

Iterate Input rows
  Iterate Input cols
    Output(cols, rows) = Input(rows, cols)
  End
End

Return Output
=end

def transpose(input)
  output = [Array.new, Array.new, Array.new]

  input.each_with_index do |row_array, row|
    row_array.each_with_index do |ele, col|
      output[col][row] = ele
    end
  end

  output
end

def transpose!(input)
  0.upto(input.length - 1) do |row|
    row.upto(input.first.length - 1) do |col|
      input[row][col], input[col][row] = input[col][row], input[row][col]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
