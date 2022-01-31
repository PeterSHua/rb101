=begin

input = given array of strings
output = count of occurances of each element in the input

iterate through the input array and check if the element exists in the hash. Increment the count if the element exists, elses add to the hash.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

car => 4
truck => 3
SUV => 1
motorcycle => 2

iterate the input
  - if hash[input] empty
      add hash[input]
	- else
	    hash[input] += 1

=end

def count_occurrences(vehicles)
	h = {}
	for vehicle in vehicles
		vehicle = vehicle.downcase!
	end 
	
	for vehicle in vehicles
		if h[vehicle] == nil
			h[vehicle] = 1
		else
			h[vehicle] += 1
		end
	end
	
	h.each { |k,v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurrences(vehicles)