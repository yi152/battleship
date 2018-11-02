import UIKit

func printBoard(board: ) {
  for row in board:
    print (" ").join(row)
}

func randomRow(board) -> Int {
  let number = Int.random(in: 0 ..< len(board) - 1)
  return number
}
  
func randomCol(board) -> Int {
  let number = Int.random(in: 0 ..< len(board) - 1)
  return number
}

func detWinner(p1_score: Int, p2_score: Int) {
  print ("P1 score: %s P2 score: %s" % (p1Score, p2Score))
  if (p1Score > p2Score) {
    print ("P1 wins!")
  } else if (p1Score < p2Score) {
    print ("P2 wins!")
  } else {
    print ("Tie!")
  }
}

func makeShips():
  global ship1Row
  global ship1Col1
  global ship1Col2
  global ship1Col3
  global ship2Row1
  global ship2Row2
  global ship2Col
  ship1Row = randomRow(board)
  ship1Col1 = randomCol(board)
  ship1Col2 = ship1Col1 - 1
  ship1Col3 = ship1Col2 - 1
  ship2Row1 = random_row(board)
  ship2Row2 = ship2Row1 - 1
  ship2Col = randomCol(board)
  while True:
    if ((ship2Col == ship1Col1) || (ship2Col == ship1Col2) || (ship2Col == ship1Col3)) && ((ship2Row1 == ship1Row) || (ship2Row2 == ship1Row)) {
      ship1Col1 = randomRow(board)
      ship2Row1 = randomCol(board)
      continue
    } else {
      break
    }

func play() {
  global board
  var board = [[String]](repeating: [String](repeating: "O", count: 7), count: 7)
  printBoard(board)
}

  let numShips = 5
  makeShips()

  let p1Score = 0
  let p2Score = 0

  for turn in 0...11 {
    print ("Turn"), turn + 1
    print ("P1, Guess Row: ")
    let p1Row = readInt() - 1
    print ("P1, Guess Col: ")
    let p1Col = readInt() - 1
    if (p1Row == ship1Row && (p1Col == ship1Col1 || p1Col == ship1Col2 || p1Col == ship1Col3)) || (p1Col == ship2Col && (p1Col == ship2Row1 || p1Col == ship2Row2)):
      print ("Congratulations, P1! You hit my battleship!")
      numShips -= 1
      p1Score += 1
      board[p1Row][p1Col] = "S"
      print_board(board)
    }
    else {
      if (p1Row not in range(6) || p1Col not in range(6)) {
        print ("Oops, that's not even in the ocean.")
      } else if (board[p1Row][p1Col] == "X") {
          print ("You guessed that one already.")
      } else {
        print ("You missed my battleship!")
        board[p1Row][p1Col] = "X"
      }
      printBoard(board)
    }
    if (numShips == 0) {
      print ("Game Over!")
      detWinner(p1_score, p2_score)
      break
    }
  }

    print ("P2, Guess Row: ")
    let p2Row = readInt() - 1
    print ("P2, Guess Col: ")
    let p2Col = readInt() - 1
    if (p2Row == ship1Row && (p2Col == ship1Col1 or p2Col == ship1Col2 or p1Col == ship1Col3)) || (p2Col == ship2Col && (p2Col == ship2Row1 or p2Col == ship2Row2)):
      print ("Congratulations, P2! You hit my battleship!")
      numShips -= 1
      p2Score += 1
      board[p2Row][p2Col] = "S"
      print_board(board)
    }
    else {
      if p2_row not in range(6) || p2_col not in range(6) {
        print ("Oops, that's not even in the ocean.")
      } else if (board[p2_row][p2_col] == "X") {
        print("You guessed that one already.")
      } else {
        print ("You missed my battleship!")
        board[p2Row][p2Col] = "X"
      }
      print_board(board)
    }
    if (turn == 11 || numShips == 0) {
      print ("Game Over!")
      det_winner(p1Score, p2Score)
      break
    }
while True:
  play()
  print ("Rematch? Y/N ")
  let rematch = readLine()
  rematch = rematch.uppercased()
  if (rematch == "Y") {
    continue
  } elif (rematch == "N") {
    break
  } else {
    print ("Invalid selection.")
    break
  }
