// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Io Day 3

// Enhance the XML program to add spaces to show the indentation
// structure.

// Enhance the XML program to handle attributes: if the first argu-
// ment is a map (use the curly brackets syntax), add attributes to
// the XML program. For example:
// book({"author": "Tate"}...) would print <book author="Tate">:

Builder := Object clone
Builder indent := ""			// For pretty printing.
Builder attributed := false		// State variable to check when to print attributes.
Builder forward := method(		// If the method is unknown.
	write(indent, "<" , call message name)		// Open the tag. Don't close, since we may have attributes.
	self indent = self indent with("  ")		// Increment the indent.
	call message arguments foreach(i, arg,
		content := nil							// Set content to nil to ensure a clean start every loop.
		if(arg asString beginsWithSeq("curlyBrackets"),	// If this argument starts with a curly bracket...
			if(i == 0, 	// If this is the first argument, we found an attribute!
				self doMessage(arg); writeln(">")
			), 
			if(i == 0, // If it isn't an attribute, close the tag then set content. Otherwise, just set content.
				writeln(">"); content := self doMessage(arg),
				content := self doMessage(arg)
			)
		)
		// Print sequences and numbers, but nothing else. This isn't robust since there are clearly other things to print.
		if((content type == "Sequence" or content type == "Number"), writeln(indent, content))
	)
	self indent = self indent asMutable removeSuffix("  ")	// Decrement the indent.
	writeln(indent, "</" , call message name, ">" )			// End the tag.
)
OperatorTable addAssignOperator(":" , "attribute" )			// If we get a :, call attribute.
curlyBrackets := method(			// Just evaluate curly brackets' content as if it's code... calling forward.
	s := Sequence clone
	call message arguments foreach(arg,
		s doMessage(arg)
	)
	s
)
Sequence attribute := method(		// We found an attribute! So, print it. Nothing else to do.
	write(" ", 
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"" ), 
		"=\"", 
		call evalArgAt(1), 
		"\""
	)
)
doString("		// Test case. Should print the attributes inside the book tag.
	Builder ul(
		li(\"Io\" ),
		li(\"Lua\" ),
		li(\"JavaScript\" )
		book({\"author\": \"Tate\", \"reader\": \"Tyler\"}, \"A bunch of words...\")
	)
")