// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 2

// How would you change / to return 0 if the denominator is zero?

// Store the original division slot so we can restore it later (with additions).
originalDivision := Number getSlot("/")

// If we're dividing by 0, return 0, else do the usual.
Number / = method(i, if(i==0, 0, originalDivision(i)))

(10 / 5) println // Should print 2.
(10 / 0) println // Should print 0.
