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
    opponent_color = self.color == :black ? :white : :black 
    pos_dup = self.pos.dup

    moves = []
    pos_dup = [pos_dup[0] + dx, pos_dup[1] + dy]

    while pos_dup[0].between?(0,7) && pos_dup[1].between?(0,7)
      if self.board[pos_dup].color == self.color
        break
      elsif self.board[pos_dup].color == opponent_color
        moves << pos_dup
        break
      else
        moves << pos_dup
        pos_dup = [pos_dup[0] + dx, pos_dup[1] + dy]
      end
    end
    moves
  end

end