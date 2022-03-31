=begin
Input: Matrix
Output: Matrix rotated clockwise by 90

90 deg:
row, col -> col, (max_row_idx - row)

180 deg:
row, col -> (max_row_idx - row, max_col_idx, col)

270 deg:
row, col -> (max_col_idx - col, row)

Output = []

Input.First.Length Times
  Output << Create empty array
End

Iterate 0 to max_row_idx
  Iterate 0 to max_col_idx
    Output(Col, max_row_idx - Row) = Input(Row, Col)
  End
End

Return Output

90 deg:
row, col -> col, (max_row_idx - row)

180 deg:
row, col -> (max_row_idx - row, max_col_idx - col)

270 deg:
row, col -> (max_col_idx - col, row)
=end

def rotate(input, deg)
  output = []

  input.first.length.times do
    output << Array.new
  end

  max_col_idx = input.first.length - 1
  max_row_idx = input.length - 1

  0.upto(max_row_idx) do |row|
    0.upto(max_col_idx) do |col|
      rotated_row, rotated_col = case deg
      when 90 then [col, max_row_idx - row]
      when 180 then [max_row_idx - row, max_col_idx - col]
      when 270 then [max_col_idx - col, row]
      when 360 then return input
      end

      output[rotated_row][rotated_col] = input[row][col]
    end
  end

  output
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate(matrix1, 90)
new_matrix2 = rotate(matrix2, 90)
new_matrix3 = rotate(rotate(rotate(rotate(matrix2, 90), 90), 90), 90)
new_matrix4 = rotate(matrix1, 180)
new_matrix5 = rotate(matrix2, 270)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
p new_matrix4 == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p new_matrix5 == [[2, 8], [4, 0], [7, 1], [3, 5]]
