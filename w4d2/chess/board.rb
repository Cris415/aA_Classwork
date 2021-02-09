class Board
  def initialize
    @rows = Array.new(8) { Array.new(8) }
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
    @rows[end_pos] = @rows[start_pos]
  end

end