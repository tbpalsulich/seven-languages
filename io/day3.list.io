// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 3

// Create a list syntax that uses brackets.

curlyBrackets := method(
	list := call message arguments map(v,
		self doMessage(v)
	)
	return list
)


mList := {"First", "Second", "Third"}
mList println // Should print "list(First, Second, Third)"

