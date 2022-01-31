=begin
input: Current age, retirement age
output: current year, retirement year, years until retirement

Get the current year.
Calculate the years until retirement (retirement age - current age)
Calculate the retirement year (current year + years until retirement)
Print current year, retirement year, years until retirement

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

print "What is your age? "
age_current_yr = gets.chomp.to_i
print "At what age would you like to retire? "
age_retire_yr = gets.chomp.to_i

current_yr = Time.new.year
work_yr = age_retire_yr - age_current_yr
retire_yr = current_yr + work_yr

puts "It's #{current_yr}. You will retire in #{retire_yr}."
puts "You have only #{work_yr} years of work to go!"
