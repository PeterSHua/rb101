=begin
input: string
output: new string with staggered capitalization

first index starts with capital
non-letters count in the capitalization scheme

iterate the input string chars
  upcase char if even index
  downcase char if odd index
=end

def staggered_case(input, up_first = true, count_non_letters = true)
  up = up_first
  input.chars.map do |char|
    if char =~ /[a-zA-Z]/
      char = up ? char.upcase : char.downcase
      up = !up
    else
      up = !up if count_non_letters
    end
    char
  end.join
end

puts staggered_case('I Love Launch School!', true, false) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS', true, false) == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers', true, false) == 'IgNoRe 77 ThE 444 nUmBeRs'

puts staggered_case('I Love Launch School!', true, true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS', true, true) == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers', true, true) == 'IgNoRe 77 ThE 444 NuMbErS'
