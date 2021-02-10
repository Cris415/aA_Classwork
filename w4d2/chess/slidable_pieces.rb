require_relative "piece.rb"

class Rook < Piece
  include Slidable

  def symbol
    # "#{self.color} #{:rook}"
    :rook
  end

  def move_dirs

  end

end

class Bishop < Piece
  include Slidable

  def symbol
    # "#{self.color} #{:rook}"
    :bishop
  end

  def move_dirs

  end

end

class Queen < Piece
  include Slidable

  def symbol
    # "#{self.color} #{:rook}"
    :queen
  end

  def move_dirs

  end

end