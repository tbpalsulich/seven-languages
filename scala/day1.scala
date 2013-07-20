// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Scala Day 1

// Write a game that will take a tic-tac-toe board with X, O, and blank
// characters and detect the winner or whether there is a tie or no
// winner yet. Use classes where appropriate.

// Bonus problem: Let two players play tic-tac-toe.


class Board(positions: Array[String]){
	var player = "X"
	val lines = Vector(
		Vector(0, 1, 2),
		Vector(3, 4, 5),
		Vector(6, 7, 8),
		Vector(0, 3, 6),
		Vector(1, 4, 7),
		Vector(2, 5, 8),
		Vector(0, 4, 8),
		Vector(2, 4, 6))
	def state() :Boolean ={
		lines.foreach {line =>
			if(positions(line(0)) == positions(line(1)) && 
			   positions(line(1)) == positions(line(2)) &&
			   positions(line(2)) != "-") {
				println("Player " + positions(line(0)) + " won!")
				return false
			}
		}
		positions.foreach {box =>
			if(box == "-") {
				return true
			}
		}
		println("Draw!")
		return false

	}
	def print() {
		println(positions(0) + " | " + positions(1) + " | " + positions(2))
		println("---------")
		println(positions(3) + " | " + positions(4) + " | " + positions(5))
		println("---------")
		println(positions(6) + " | " + positions(7) + " | " + positions(8))
	}
	def play(index: Int) {
		if(positions(index) == "-"){
			positions(index) = player
			if(player == "X") player = "O"
			else player = "X"
		}
		else {
			println("You can't go there!")
		}
	}
	def turn() :String = {
		return player + "'s turn:"
	}
}

val bBoard = new Board(Array("-", "-", "-", "-", "-", "-", "-", "-", "-"))
bBoard.print
while(bBoard.state){
	try{
		val input = readLine(bBoard.turn).toInt
		bBoard.play(input)
		println
		bBoard.print
	} catch {
		case e => {println("I didn't understand that...")}
	}
}