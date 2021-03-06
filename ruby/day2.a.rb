# Tyler Palsulich
# Seven Languages in Seven Weeks, by Bruce A. Tate
# Ruby Day 2

# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. Now, do the same with each_slice in
# Enumerable.

mArray = (1..16).to_a

i = 0
puts "Part 1:"
mArray.each do |num|
	p mArray[i, 4] if i % 4 == 0
	i += 1
end

puts
puts "Part 2:"
mArray.each_slice(4) {|nums| p nums}
