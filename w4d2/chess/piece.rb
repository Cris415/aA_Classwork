
class Piece
  attr_reader :color, :board, :pos, :symbol
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def inspect
    "Piece - color: #{@color}"
  end

  def symbol

  end

end
