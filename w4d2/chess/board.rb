require_relative "pieces"

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) { Array.new(8) }
    add_pieces
  end

  def add_pieces
    @rows.each_with_index do |row, idx|
      row.each_with_index do |square, idx_2|
        if idx == 0 || idx == 1
          @rows[idx][idx_2] = Piece.new(:white, @rows, [idx, idx_2])
        elsif idx == 6 || idx == 7
          @rows[idx][idx_2] = Piece.new(:black, @rows, [idx, idx_2])
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    # replace start_pos with null piece
    if start_pos == nil
      raise "No piece at start position"
    elsif (end_pos == nil) && end_pos[0].between?(0,7) && end_pos[1].between?(0,7)
      raise "Cannot move to position"
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    return end_pos
  end

end

board = Board.new
board.move_piece([0,0], [3,3])
p board