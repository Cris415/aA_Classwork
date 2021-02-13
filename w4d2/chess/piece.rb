
class Piece
  attr_reader :color, :board, :symbol
  attr_accessor :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def inspect
    "#{symbol} - #{@color}"
  end

  def symbol

  end

  def empty?
    false
  end

end
