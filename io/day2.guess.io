// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 2

// Write a program that gives you ten tries to guess a random number
// from 1–100. If you would like, give a hint of “hotter” or “colder”
// after the first guess.

number := Random value(1, 100) floor
input := File standardInput
"Guess a number between 1 and 100" println
guess := nil
previousGuess := nil
10 repeat(
	while(previousGuess == guess or guess isNan,
		guess := input readLine asNumber
	)
	if(guess == number, "You got it!" println; return,
		write("Guess again! \n")
		if(previousGuess != nil, 
			if((number - guess) abs < (number - previousGuess) abs, 
				"But, getting warmer..." println, 
				"But, getting colder..." println
			)
		)
		previousGuess = guess
	)
)
write("You failed... The number was ", number, "\n")