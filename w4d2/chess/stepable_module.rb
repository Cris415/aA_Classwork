module Stepable

  def moves
    possible_moves = []
    start_pos = self.pos.dup
    p start_pos
    self.move_diffs.each do |pos|
      dx, dy = pos
      end_pos = [start_pos[0] + dx, start_pos[1] + dy]
      on_board = end_pos[0].between?(0,7) && end_pos[1].between?(0,7)
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