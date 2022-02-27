=begin
input: string 'First Last'
output: new string 'Last, First'

split string into array
reverse the array
join the array with ,
=end

def swap_name(str)
  str.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
