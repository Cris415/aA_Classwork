require "colorize"
require_relative "cursor.rb"

class Display
  attr_reader :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    board.rows.each do |row|
      row.each do |el|
        if el.symbol != :null_piece
          print el.to_s.blue
        else
          print " "
        end
        print " | "
      end
      print "\n"
      print "--------------------------------"
      print "\n"
    end

  end

end