require_relative "piece"

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
    move_pos = [[-1, 1],[1,1],[-1,-1],[1,-1],[-1,0], [1, 0], [0, -1], [0, 1]]
  end

end

module Stepable

  def moves
    possible_moves = []
    pos_dup = self.pos.dup

    self.move_diffs.each do |pos|
      end_pos = [pos_dup[0] + pos[0], pos_dup[1] + pos[1]]
       on_board = end_pos[0].between(0,7) && end_pos[1].between(0,7)
      if self.board[end_pos].color != self.color && on_board
        possible_moves << end_pos
      end 
    end
    possible_moves
  end

  private
  def move_diffs
    raise "Move diffs method required"
  end

end