=begin
Input: Two sorted arrays
Output: One new array with all input elements sorted

Input arrays can be of different length
Input array can be empty
Do not mutate the input

arr1_idx = 0
arr2_idx = 0
Output = []

Loop
  If Arr1[Arr1_idx] is nil
    Output = Output + Arr2[Arr2_idx..]
    break
  Elsif Arr2[Arr2_idx] is nil
    Output = Output + Arr1[Arr1_idx..]
    break
  Else
    Case Arr1[Arr1_idx] <=> Arr2[Arr2_idx]
    When -1
      Output << Arr1[Arr1_idx]
      Arr1_idx++
    When 0
      Output << Arr1[Arr1_idx] << Arr2[Arr2_idx]
      Arr1_idx++
      Arr2_idx++
    When 1
      Output << Arr2[Arr2_idx]
      Arr2_idx++
    End
  End
End

Return Output
=end

def merge(arr1, arr2)
  arr1_idx = 0
  arr2_idx = 0
  output = []

  loop do
    if arr1[arr1_idx].nil?
      output = output + arr2[arr2_idx..]
      break
    elsif arr2[arr2_idx].nil?
      output = output + arr1[arr1_idx..]
      break
    else
      case (arr1[arr1_idx] <=> arr2[arr2_idx])
      when -1
        output << arr1[arr1_idx]
        arr1_idx += 1
      when 0
        output << arr1[arr1_idx] << arr2[arr2_idx]
        arr1_idx += 1
        arr2_idx += 1
      when 1
        output << arr2[arr2_idx]
        arr2_idx += 1
      end
    end
  end

  output
end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]
