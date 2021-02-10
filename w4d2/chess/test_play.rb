require_relative "board.rb"

board = Board.new
board.move_piece([7,7], [3,3])
p board[[3,3]].moves
p board[[3,3]].symbol
p board[[3,3]].to_s