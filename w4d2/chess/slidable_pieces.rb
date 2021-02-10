require_relative "piece.rb"
require_relative "slidable_module.rb"

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

