require_relative "pieces"

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
    add_pieces
  end

  def add_pieces
    @rows.each_with_index do |row, idx|
      row.each_with_index do |square, idx_2|
        if idx == 1
          @rows[idx][idx_2] = Pawn.new(:white, self, [idx, idx_2])
        elsif idx == 0
          if idx_2 == 0 || idx_2 == 7
            @rows[idx][idx_2] = Rook.new(:white, self, [idx, idx_2])
          elsif idx_2 == 1 || idx_2 == 6
            @rows[idx][idx_2] = Knight.new(:white, self, [idx, idx_2])
          elsif idx_2 == 2 || idx_2 == 5
            @rows[idx][idx_2] = Bishop.new(:white, self, [idx, idx_2])
          elsif idx_2 == 3
            @rows[idx][idx_2] = Queen.new(:white, self, [idx, idx_2])
          else
            @rows[idx][idx_2] = King.new(:white, self, [idx, idx_2])
          end
        elsif idx == 6
          @rows[idx][idx_2] = Pawn.new(:black, self, [idx, idx_2])
        elsif idx == 7
          if idx_2 == 0 || idx_2 == 7
            @rows[idx][idx_2] = Rook.new(:black, self, [idx, idx_2])
          elsif idx_2 == 1 || idx_2 == 6
            @rows[idx][idx_2] = Knight.new(:black, self, [idx, idx_2])
          elsif idx_2 == 2 || idx_2 == 5
            @rows[idx][idx_2] = Bishop.new(:black, self, [idx, idx_2])
          elsif idx_2 == 3
            @rows[idx][idx_2] = Queen.new(:black, self, [idx, idx_2])
          else
            @rows[idx][idx_2] = King.new(:black, self, [idx, idx_2])
          end
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
    if !start_pos[0].between?(0,7) || !start_pos[1].between?(0,7)
      raise "Not a valid start position"
    elsif !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7) 
      raise "Cannot move to position"
    elsif self[start_pos].symbol == :null_piece
      raise "No piece at start position"
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
    return end_pos
  end

end