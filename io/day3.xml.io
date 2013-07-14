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
Builder indent := ""
Builder attributed := false
Builder forward := method(
	Builder attributed = false
	write(indent, "<" , call message name)
	if(call message argAt(0) asString beginsWithSeq("curlyBrackets"), 
		content := self doMessage(call message argAt(0))
		Builder attributed = true
	)
	writeln(">")
	self indent = self indent with("  ")
	call message arguments foreach(i, arg,
		if(i > 0, Builder attributed = false)
		content := self doMessage(arg);
		if((content type == "Sequence" or content type == "Number") and Builder attributed == false, writeln(indent, content); Builder attributed = false)
	)
	self indent = self indent asMutable removeSuffix("  ")
	writeln(indent, "</" , call message name, ">" )
)
OperatorTable addAssignOperator(":" , "attribute" )
curlyBrackets := method(
	s := Sequence clone
	call message arguments foreach(arg,
		s doMessage(arg)
	)
	s
)
Sequence attribute := method(
	if(Builder attributed == false,
		write(" ", 
			call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"" ), 
			"=\"", 
			call evalArgAt(1), 
			"\""
		)
	)
)
doString("
Builder ul(
	li(\"Io\" ),
	li(\"Lua\" ),
	li(\"JavaScript\" )
	book({\"author\": \"Tate\", \"reader\": \"Tyler\"}, \"A bunch of words...\")
)
")