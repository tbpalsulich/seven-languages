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
			player = notTurn
		}
		else {
			println("You can't go there!")
		}
	}
	def turn() :String = {
		return player + "'s turn:"
	}
	def notTurn() :String = {
		if(player == "X") return "O"
		return "X"
	}

	def twoInARow(mark: String, known: Int) :Int = {
		lines.foreach {line =>
			var count = 0
			line.foreach {box =>
				if(positions(box) == mark) count += 1
			}
			if(count == 2){
				if(positions(line(0)) == "-" && line(0) != known) return line(0)
				if(positions(line(1)) == "-" && line(1) != known) return line(1)
				if(positions(line(2)) == "-" && line(2) != known) return line(2)
			}
			count = 0
		}
		return -1
	}
	def fork(mark: String, index: Int) :Boolean = {
		positions(index) = mark
		val first = twoInARow(mark, -1)
		if(first != -1){
			val second = twoInARow(mark, first)
			positions(index) = "-"
			if(second != -1) return true
			return false
		}
		positions(index) = "-"
		return false
	}
	def makeTwoInARow() :Int = {
		var index = 0
		for(index <- 0 to 7){
			if(positions(index) == "-"){
				positions(index) = player
				val blockMove = twoInARow(player, -1)
				if(blockMove > -1){
					if(!fork(notTurn, blockMove)){
						positions(index) = "-"
						positions(blockMove) = "-"
						return index
					}
				}
				positions(index) = "-"
			}
		}
		return -1
	}
	def preventFork() :Int = {
		var i = 0
		for(i <- 0 to 7){
			if(positions(i) == "-"){
				if(fork(notTurn, i)){
					return i
				}
			}
		}
		return -1
	}

	def bestMove() :Int = {
		val forTheWin = twoInARow(player, -1)
		if(forTheWin > -1) return forTheWin
		val forTheBlock = twoInARow(notTurn, -1)
		println("This?")
		if(forTheBlock > -1) return forTheBlock
		val makeTwo = makeTwoInARow
		if(makeTwo > -1) return makeTwo
		val stopAFork = preventFork
		if(stopAFork > -1) return stopAFork
		if(positions(4) == "-") return 4
		if(positions(0) == notTurn && positions(8) == "-") return 8
		println("Here?")
		if(positions(2) == notTurn && positions(6) == "-") return 6
		if(positions(6) == notTurn && positions(2) == "-") return 2
		if(positions(8) == notTurn && positions(0) == "-") return 0
		if(positions(0) == "-") return 0
		if(positions(2) == "-") return 2
		if(positions(8) == "-") return 8
		println("Maybe here?")
		if(positions(6) == "-") return 6
		if(positions(1) == "-") return 1
		if(positions(3) == "-") return 3
		if(positions(5) == "-") return 5
		if(positions(7) == "-") return 7
		return -1
	}

	def reset() = {
		player = "X"
		var i = 0
		for(i <- 0 to 8) positions(i) = "-"
	}
}

val bBoard = new Board(Array("-", "-", "-", "-", "-", "-", "-", "-", "-"))
bBoard.print
while(bBoard.state){
	try{
		val input = readLine(bBoard.turn)
		if(input == "reset"){
			bBoard.reset
			println
			bBoard.print
		}
		else {
			val index = input.toInt
			bBoard.play(index)
			println(bBoard.bestMove)
			println
			bBoard.print
		}
		} catch {
			case e => {println("I didn't understand that...")}
		}
	}