require_relative "board.rb"

board = Board.new
end_pos = [2,2]
board.move_piece([0,2], end_pos)
# board.move_piece([7,7] , [2,1])
p board[end_pos].moves
p board[end_pos].moves.length 

p board[end_pos].symbol
p board[end_pos].to_s