// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 2

// Write a program that gives you ten tries to guess a random number
// from 1–100. If you would like, give a hint of “hotter” or “colder”
// after the first guess.

number := Random value(1, 100) floor		// Make sure it's an integer.
input := File standardInput					// Just to make code cleaner.
"Guess a number between 1 and 100" println
// Initialize guess and previousGuess to nil to check if this is the first round of guessing.
guess := nil
previousGuess := nil
10 repeat(	// You get ten guesses.
	while(previousGuess == guess or guess isNan,	// Ignore empty lines consecutive repeats.
		guess := input readLine asNumber
	)
	if(guess == number, "You got it!" println; return,	// Print success and stop execution if correct.
		write("Guess again! \n")		// Else let the user guess again.
		if(previousGuess != nil, 		// Ensure this isn't the first round.
			if((number - guess) abs < (number - previousGuess) abs, 
				"But, getting warmer..." println, 
				"But, getting colder..." println
			)
		)
		previousGuess = guess
	)
)
// Will only reach if the user didn't guess the number correctly.
write("You failed... The number was ", number, "\n")