require_relative "piece.rb"
require_relative "stepable_module.rb"

class Knight < Piece
  include Stepable

  def symbol
    # "#{self.color} #{:rook}"
    :knight
  end

  def to_s
    self.color == :black ? "♞" : "♘"
  end

  protected
  def move_diffs
    move_pos = [[1, 2], [-1, 2], [1, -2], [-1, -2],[2, 1],[-2, -1],[2, -1],[-2, 1]]
  end

end

class King < Piece
  include Stepable
  def symbol
    # "#{self.color} #{:rook}"
    :king
  end

  def to_s
    self.color == :black ? "♚" : "♔"
  end

  protected
  def move_diffs
    move_pos = [[-1, 1],[1, 1],[-1,-1],[1,-1],[-1,0], [1, 0], [0, -1], [0, 1]]
  end

end