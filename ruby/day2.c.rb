# Tyler Palsulich
# Seven Languages in Seven Weeks, by Bruce A. Tate
# Ruby Day 2

file = "textfile.txt"
search_term = "test"
lines = File.readlines(file)
lines.select do |line|
	puts "#{lines.find_index(line) + 1}:#{line}" if line[search_term]
end
