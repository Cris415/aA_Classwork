require_relative "piece.rb"

class Rook < Piece
  include Slidable

  def symbol
    # "#{self.color} #{:rook}"
    :rook
  end

  def to_s
    self.color == :black ? "♜" : "♖"
  end

  private
  def move_dirs
    self.horizontal_dirs
  end

end

class Bishop < Piece
  include Slidable

  def symbol
    # "#{self.color} #{:rook}"
    :bishop
  end

  def to_s
    self.color == :black ? "♟" : "♗"
  end

  private
  def move_dirs
    self.diagonal_dirs
  end

end

class Queen < Piece
  include Slidable

  def symbol
    # "#{self.color} #{:rook}"♜
    :queen
  end

  def to_s
    self.color == :black ? "♛" : "♕"
  end

  private
  def move_dirs
    self.horizontal_dirs + self.diagonal_dirs
  end

end

module Slidable
  HORIZONTAL_DIRS = [[1,0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [-1, -1], [1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = []
    move_dirs.each do |pos|
      possible_moves += grow_unblocked_moves_in_dir(pos[0], pos[1])
    end
    possible_moves
  end

  private

  def move_dirs
    raise "move_dirs method required"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    pos_dup = self.pos.dup
    moves = []
    until !pos_dup[0].between(0,7) || !pos_dup[1].between(0,7)
      pos_dup = [pos_dup[0] + dx, pos_dup[1] + dy]
      if self.board[pos_dup].color == self.color
        break
      elsif self.board[pos_dup].color != self.color
        moves << pos_dup
        break
      else
        moves << pos_dup
      end
    end
    moves
  end

end