require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :null_piece
  end

  def symbol
    :null_piece
  end

  def moves
    #TODO: raise error ??
    []
  end

end