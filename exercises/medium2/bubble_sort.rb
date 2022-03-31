=begin
Input: array
Output: sorted array

n = Length of input

loop do
  swapped = false

  loop from 1 to n - 1 inclusive
    if array[index - 1] > array[index]
      swap array[index - 1], array[index]
      swapped = true
    end
  end

  n = n - 1

  break if swapped = false
end
=end

def bubble_sort!(array)
  n = array.length

  loop do
    swapped = false

    1.upto(n-1) do |idx|
      if array[idx - 1] > array[idx]
        array[idx - 1], array[idx] = array[idx], array[idx - 1]
        swapped = true
      end
    end

    n = n - 1

    break if swapped == false
  end
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
