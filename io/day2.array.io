// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 2

// Write a program to add up all of the numbers in a two-dimensional
// array.

// Add a slot called myAverage to a list that computes the average of
// all the numbers in a list. What happens if there are no numbers
// in a list? (Bonus: Raise an Io exception if any item in the list is not
// a number.)

List twoDimSum := method(
	sum := 0
	flat := self flatten()
	flat foreach(i, v, 
		if(v type == "Number",
			sum = sum + v, 
			Exception raise("That's not a number!")
		)
	)	
)
List myAverage := method(
	self twoDimSum / self flatten size
)

mList := list(list(1, 2, 3), list(4, 5, 6))
mList twoDimSum println
mList myAverage println
