file = "file.txt"
search_term = "test"
lines = File.readlines(file)
lines.select do |line|
	puts "#{lines.find_index(line) + 1}:#{line}" if line[search_term]
end
