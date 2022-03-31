=begin
Input: Year
Output: Number of Friday the 13ths in Year

Year > 1752
Friday the 13th is a Friday that lands on the 13th day of a month

Create a Date object for the given Year

For each Month in the Year,
  If the 13th of that Month is a Friday
    Increment Unlucky Day Count
  End
End

Return Unlucky Day Count
=end

require 'date'

DAY = 13
MONTHS = (1..12).to_a

def friday_13th(year)
  unlucky_count = 0

  MONTHS.each do |month, count|
    unlucky_count += 1 if Date.new(year, month, DAY).friday?
  end

  unlucky_count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

=begin
Further Exploration

Five Friday Months = 0

For each month in the year,
  Set day = 1

  While current date is still the month being iterated
    Check the date if it is a Friday
      Increment Friday Count
    End

    Go to next day
  End

  Increment Five Friday Months if Friday Count == 5
End

=end

require 'pry-byebug'

def fridays(year)
  five_fridays_count = 0

  MONTHS.each do |month|
    day = 1
    date = Date.new(year, month, day)
    friday_count = 0

    while date.month == month
      friday_count += 1 if date.friday?

      date = date.next_day
    end

    five_fridays_count += 1 if friday_count == 5
  end

  five_fridays_count
end

puts fridays(2022)
