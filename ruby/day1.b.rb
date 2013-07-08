# Tyler Palsulich
# Seven Languages in Seven Weeks, by Bruce A. Tate
# Ruby Day 1

num = rand(50)
guess = 0
while num != guess
	puts "Guess a number!"
	guess = gets.to_i
	puts "You're too high" if guess > num
	puts "You're too low"  if guess < num
end
puts "You got it!"
