def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def valid_move?(board, position)
  if position.to_i.between?(1,9)
    if position_taken?(board, position.to_i-1)
      return true
    elsif board[index] == "X" || "O"
      return false
    elsif board[index] == nil
      return false
    end
  end

  # position.to_i.between?(0,8) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, input)
    move(board, input)
    display_board(board)
  else
    turn(board)
  end
end

def position_taken?(board, input)
  board[input] != " "
end

def move(board, input, current_player = "X")
  board[input.to_i-1] = current_player
end
