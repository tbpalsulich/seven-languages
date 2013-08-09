// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 3

// Create a list syntax that uses brackets.

curlyBrackets := method(
	// Create a list from evaluating each argument between the curly brackets.
	list := call message arguments map(v,
		self doMessage(v)
	)
	return list
)


mList := {"First", "Second", "Third"}
mList println 		// Should print "list(First, Second, Third)"

