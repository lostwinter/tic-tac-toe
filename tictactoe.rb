#Tic Tac Toe Game

#Steps to building the gamee:
# 1. Draw board
# 2. Loop:
# a) player1 picks empty square. Check for winner. Redraw
# b) player2 picks empty square. Check for winner. Redraw
# 5. Game ends if winner or no empty squares.
# 6. Display winner or stalemate
# 7. Offer play again

def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' '}
  board
end

def draw_board(board)
  system 'clear'
  puts " #{board[1]}  | #{board[2]}  | #{board[3]}  "
  puts "______________"
  puts " #{board[4]}  | #{board[5]}  | #{board[6]}  "
  puts "______________"
  puts " #{board[7]}  | #{board[8]}  | #{board[9]}  "
end

def empty_postion(board)
  board.keys.select{|k, v| board[k] == ' '}
end

def full_board?(board)
  empty_postion(board) == []
end

def player_choice(board)
  begin
    puts "Choose a square (1-9)"
    position = gets.chomp.to_i
  end until empty_postion(board).include?(position)
  board[position] = 'X'
end

def computer_choice(board)
  position = empty_postion(board).sample
  board[position] = 'O'
end

def check_for_winner(board)
  # winning_options = Array of win conditions
  winning_options = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7], [1,4,7], [2,5,8], [3,6,9]]
  # winning_options.each do |position|
  winning_options.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def winner_prompt(winner)
  puts"#{winner} wins!"
end

loop do
    board = initialize_board
    draw_board(board)
  begin 
    player_choice(board)
    draw_board(board)
    computer_choice(board)
    draw_board(board)
    winner = check_for_winner(board)
  end until winner || full_board?(board)
    winner_prompt
  puts "Play again? (Y/N)"
  break if gets.chomp.upcase != 'Y'
end
