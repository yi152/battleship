from random import randint

def print_board(board):
  for row in board:
    print " ".join(row)

def random_row(board):
  return randint(0, len(board) - 1)

def random_col(board):
  return randint(0, len(board[0]) - 1)

def det_winner(p1_score, p2_score):
  print "P1 score: %s P2 score: %s" % (p1_score, p2_score)
  if p1_score > p2_score:
    print "P1 wins!"
  elif p1_score < p2_score:
    print "P2 wins!"
  else:
    print "Tie!"

def make_ships():
  global ship1_row
  global ship1_col1
  global ship1_col2
  global ship1_col3
  global ship2_row1
  global ship2_row2
  global ship2_col
  ship1_row = random_row(board)
  ship1_col1 = random_col(board)
  ship1_col2 = ship1_col1 - 1
  ship1_col3 = ship1_col2 - 1
  ship2_row1 = random_row(board)
  ship2_row2 = ship2_row1 - 1
  ship2_col = random_col(board)
  while True:
    if ((ship2_col == ship1_col1) or (ship2_col == ship1_col2) or (ship2_col == ship1_col3)) and ((ship2_row1 == ship1_row) or (ship2_row2 == ship1_row)):
      ship1_col1 = random_row(board)
      ship2_row1 = random_col(board)
      continue
    else:
      break

def play():
  global board
  board = []
  for x in range(0, 7):
    board.append(["O"] * 7)
  print_board(board)

  num_ship = 5
  make_ships()

  p1_score = 0
  p2_score = 0

  for turn in range(12):
    print "Turn", turn + 1
    p1_row = int(raw_input("P1, Guess Row: ")) - 1
    p1_col = int(raw_input("P1, Guess Col: ")) - 1
    if (p1_row == ship1_row and (p1_col == ship1_col1 or p1_col == ship1_col2 or p1_col == ship1_col3)) or (p1_col == ship2_col and (p1_col == ship2_row1 or p1_col == ship2_row2)):
      print "Congratulations, P1! You hit my battleship!"
      num_ship -= 1
      p1_score += 1
      board[p1_row][p1_col] = "S"
      print_board(board)
    else:
      if p1_row not in range(6) or p1_col not in range(6):
        print "Oops, that's not even in the ocean."
      elif board[p1_row][p1_col] == "X":
        print( "You guessed that one already." )
      else:
        print "You missed my battleship!"
        board[p1_row][p1_col] = "X"
      print_board(board)
    if num_ship == 0:
      print "Game Over!"
      det_winner(p1_score, p2_score)
      break

    p2_row = int(raw_input("P2, Guess Row: ")) - 1
    p2_col = int(raw_input("P2, Guess Col: ")) - 1
    if (p2_row == ship1_row and (p2_col == ship1_col1 or p2_col == ship1_col2 or p1_col == ship1_col3)) or (p2_col == ship2_col and (p2_col == ship2_row1 or p2_col == ship2_row2)):
      print "Congratulations, P2! You hit my battleship!"
      num_ship -= 1
      p2_score += 1
      board[p2_row][p2_col] = "S"
      print_board(board)
    else:
      if p2_row not in range(6) or p2_col not in range(6):
        print "Oops, that's not even in the ocean."
      elif board[p2_row][p2_col] == "X":
        print( "You guessed that one already." )
      else:
        print "You missed my battleship!"
        board[p2_row][p2_col] = "X"
      print_board(board)
    if turn == 11 or num_ship == 0:
      print "Game Over!"
      det_winner(p1_score, p2_score)
      break

while True:
  play()
  rematch = raw_input("Rematch? Y/N ")
  rematch = rematch.upper()
  if rematch == "Y":
    continue
  elif rematch == "N":
    break
  else:
    print "Invalid selection."
    break