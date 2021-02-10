require_relative "piece"

class Pawn < Piece
  
  def symbol
    # "#{self.color} #{:rook}"
    :pawn
  end

  def to_s
    #fix emojis
    self.color == :black ? "♜" : "♖"
  end

  def moves 
    
   
    
    forward_steps.reject {|coord| color_check?(coord) || range_check?(coord)}
      

  

  end

  def color_check?(coord)
    self.board[coord].color == :black || self.board[coord].color == :white
  end

  def range_check?(coord)
    coord[0].between(0,7) && coord[1].between(0,7)
  end

  private

  def at_start_row?
    if self.color == :black && self.pos[0] == 6
      return true
    elsif self.color == :white && self.pos[0] == 1
      return true
    end
    false
  end

  def forward_dir
    self.color == :black ? -1 : 1
  end

  def forward_steps
    poss_moves = []
    if at_start_row?
      poss_moves << [1 * forward_dir, 0]
      poss_moves << [2 * forward_dir, 0]
    else
      poss_moves = [1 * forward_dir, 0]
    end
    poss_moves
  end

  def side_attacks
    diagonal_1 = [self.pos[0] + 1, self.pos[1] + 1].map{|el| el * forward_dir }
    diagonal_2 = [self.pos[0] + 1, self.pos[1] - 1].map{|el| el * forward_dir }
    poss_attacks = []
    opponent_color = self.color == :black ? :white : :black 
    if board[diagonal_1].color == opponent_color
      poss_attacks << diagonal_1
    end
    if board[diagonal_2].color == opponent_color
      poss_attacks << diagonal_2
    end
    poss_attacks
  end

end