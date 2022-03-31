def join_natural(arr, state)
  items = case arr.length
          when 1 then arr.first.to_s
          when 2 then arr.first.to_s + ' and ' + arr.last.to_s
          else
            arr[0..-2]
            .map(&:to_s)
            .join(', ') + ', ' + 'and ' + arr.last.to_s
          end

  plural = arr.length > 1 ? ' are ' : ' is '
  items + plural + state
end

=begin
puts join_natural([1], 'on') == '1 is on'
puts join_natural([1, 4], 'off') == '1 and 4 are off'
puts join_natural([1, 2, 3, 5], 'on') == '1, 2, 3, and 5 are on'
=end

=begin
Input: n (total of switches)
Output: array of lights on

Number of iterations == n
There are n switches

[false, false, flase, false, false]
   0      1      2      3      4

Create an array of lights (boolean state) initially all false
Starting Round index = 0
Iterate n times (round index)
  Light index = round index

  Iterate the lights array (light index).
    lights[light index] = !lights[light index]
    Increment light index by (round + 1)

  Increment round index by one

Iterate the array of lights and return indicies that are true to a new array
Increment each array element by one
Return the array
=end

def thousand_lights(n)
  lights = Array.new(n, false)

  n.times do |round|
    idx = round

    while idx < n
      lights[idx] = !lights[idx]
      idx += (round + 1)
    end
  end

  on = []
  off = []

  lights.each_with_index do |light, idx|
    on << (idx + 1) if light
    off << (idx + 1) if !light
  end

  puts join_natural(on, 'on')
  puts join_natural(off, 'off')
end

thousand_lights(5) #== [1, 4]
puts
thousand_lights(10) #== [1, 4, 9]
puts
thousand_lights(1000) #== [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

=begin
Input: array of int, state = 'on' or 'off'
Output: string of input items seperated by comma and ending in grammar conjugation, 'is/are', 'on/off'

Examples
[1, 2, 3, 5] => '1, 2, 3, and 5'
[1, 4] => '1 and 4'
[1] => '1'

If input has one item, return input converted to string
If input has two items, grammar = 'and', deliminator = ''
Else, grammar = 'and', deliminator = ', '

join input from [0..-2] with deliminator
append delminiator + grammar  + ' ' + input[-1]
=end


