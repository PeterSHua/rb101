# input: string
# output: hash

# output hash
# { lowercase: count,
#   uppercase: count,
#   neither: count }

# create a hash with lowercase, uppercase, neither symbols set to count 0
# iterate characters in string
#   increment lowercase count if it's lowercase
#   increment uppercase count if it's upercase
#   else increment neither count

def letter_case_count(str)
  hsh = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  str.chars.each do |char|
    if char.match(/[a-z]/)
      hsh[:lowercase] += 1
    elsif char.match(/[A-Z]/)
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

