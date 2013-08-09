// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 2

// Write a prototype for a two-dimensional list. The dim(x, y) method
// should allocate a list of y lists that are x elements long. set(x, y,
// value) should set a value, and get(x, y) should return that value.

// Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
// matrix get(x, y) on the original list.

// Write the matrix to a file, and read a matrix from a file.

Matrix := Object clone
Matrix dim := method(x, y,		// Set the dimensions of the array.
	self lists := lists 		// List to hold the lists of elements.
	for(i, 1, x, lists push(list() setSize(y)))		// Generate the lists given the input sizes.
)
Matrix set := method(x, y, val,		// Set the element in the array at (x, y) to val.
	lists at(x - 1) atPut(y - 1, val)
	return val
)
Matrix get := method(x, y,			// Get the element in the array at (x, y).
	lists at(x - 1) at(y - 1)
)
Matrix transpose := method(			// Mirror the array so that oldArray(x, y) = newArray(y, x).
	new_matrix := self clone
	new_matrix dim(lists at(0) size, lists size)
	for(x, lists size, 1, -1, 		// For every column of the old matrix.
		for(y, lists at(0) size, 1, -1, // For every row of the old matrix.
			new_matrix set(y, x, lists at(x - 1) at(y - 1))		// Set the new_matrix value.
		)
	)
	return new_matrix
)

Matrix write := method(fileName,
	writeln("Writing matrix to ", fileName)
	file := File open(fileName)		// Open a file with the given name for printing.
	for(x, 0, lists size - 1,		// Loop through every element to print it.
		for(y, 0, lists at(0) size - 1,
			// Print to the file delimiting columns by commas and rows by newlines.
			file write(lists at(x) at(y) asString, if(y == lists at(0) size - 1, "\n", ", "))
		)
	)
	file close
)
readMatrix := method(fileName,
	file := File open(fileName)		// Open the file. Assuming it exists.
	new_matrix := Matrix clone
	new_matrix lists := list
	file foreachLine(i, line,
		new_matrix lists push(line split(", "))		// Add to the new matrix line by line, splitting by commas.
	)
	file close
	return new_matrix
)

mMatrix := Matrix clone
mMatrix dim(3, 2)
writeln("set(1, 1, 10) => ", mMatrix set(1, 1, 10))
writeln("set(2, 1, 5)  => ", mMatrix set(2, 1, 5))
writeln("set(3, 1, 2)  => ", mMatrix set(3, 1, 2))
writeln("get(1, 1)     => ", mMatrix get(1, 1))
writeln("get(2, 1)     => ", mMatrix get(2, 1))
writeln("get(3, 1)     => ", mMatrix get(3, 1), "\n")
tMatrix := mMatrix transpose
writeln("Regular Dimensions => Transposed Dimensions")
writeln("(", mMatrix lists size, ", ", mMatrix lists at(0) size, ") => "
	, "(", tMatrix lists size, ", ", tMatrix lists at(0) size, ")")
writeln("Transposed get(1, 1) => ", tMatrix get(1, 1))
writeln("Transposed get(1, 2) => ", tMatrix get(1, 2))
writeln("Transposed get(1, 3) => ", tMatrix get(1, 3))
mMatrix write("mMatrix.txt")
rMatrix := readMatrix("mMatrix.txt")
writeln("Read       get(1, 1) => ", rMatrix get(1, 1))
writeln("Read       get(2, 1) => ", rMatrix get(2, 1))
writeln("Read       get(3, 1) => ", rMatrix get(3, 1))