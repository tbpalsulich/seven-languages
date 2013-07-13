# Tyler Palsulich
# Seven Languages in Seven Weeks, by Bruce A. Tate
# Ruby Day 2

# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

file = "textfile.txt"
search_term = "test"
lines = File.readlines(file)
lines.select do |line|
	puts "#{lines.find_index(line) + 1}:#{line}" if line[search_term]
end
