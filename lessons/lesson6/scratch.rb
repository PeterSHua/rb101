=begin
def joinor(arr, delim = ', ', last = 'or')
  # input: array of int
  # output: string

  # arr[0] + 'delim' + arr[1] + 'delim'
  # + last + ' ' + 'arr[-1]
case arr.size
when 0 then return ''
when 1 then return arr.first.to_i
when 2 then delim = ' '
end

arr[0..-2].each_with_object("") { |ele, str| str << ele.to_s + delim } +
    last + ' ' + arr[-1].to_s
end
=end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

p joinor([])                   # => ""
p joinor([1])                   # => "1"
p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
