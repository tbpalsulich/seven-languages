// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Scala Day 2

// Use foldLeft to compute the total size of a list of strings.

// Write a Censor trait with a method that will replace the curse words
// Shoot and Darn with Pucky and Beans alternatives. Use a map to
// store the curse words and their alternatives.

// Load the curse words and alternatives from a file.

import scala.io.Source._

val mList = List("This", "is", "a", "list", "of", "strings.")
val length = mList.foldLeft(0)((sum, element) => sum + 1)
val size = mList.foldLeft(0)((sum, word) => sum + word.length)
println("mList length: " + length) // Should print 6.
println("mList size: " + size) // Should print 21.

trait Censor {
	var badWords = Map.empty[String, String]

	fromFile("badWords.txt").getLines.foreach { line =>
		val map = line.split(" -> ")
		badWords += (map(0) -> map(1))
	}
	def clean(input :String):String = {
		var output = input
		for((key, value) <- badWords) {
			output = output.replaceAll(key, value)
		}
		return output
	}
}

class BigBrother extends Censor

val brother = new BigBrother

val thoughtCrime = "I swear I am going to shoot the darn telescreen one day!"

val goodThoughts = brother.clean(thoughtCrime)

println("\nTime to get vaporized!")
println(thoughtCrime)

println("\nJust kidding...")
println(goodThoughts)