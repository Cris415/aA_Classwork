require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder
  attr_reader :considered_positions, :new_move_position, :build_move_tree

  def self.valid_moves(pos)
    possible_moves = [[1, 2],[-1, 2],[1, -2],[-1, -2],[-2, 1], [2, -1], [-2, -1],[2, 1]]
    x, y = pos 
    possible_moves.select do |ele|
      new_x = ele[0] += x 
      new_y = ele[1] += y
      (new_x <= 7) && (new_x >= 0) && (new_y <= 7) && (new_y >= 0)
    end 
  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    self.build_move_tree
  end
  
  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      next_up = queue.shift
      move_nodes = self.new_move_position(next_up.value).map{ |el| PolyTreeNode.new(el)}
      move_nodes.each do |child|
        next_up.add_child(child)
      end
      queue.concat(next_up.children)
    end
  end

  def find_path(end_pos)
    queue = [@root_node]
    path_taken = []

    until queue.empty?
        next_up = queue.shift 
        path_taken << next_up.parent

        queue.concat(next_up.children)
        if next_up.value == end_pos
          return path_taken.uniq
        end
    end
    nil
  end
  
  def new_move_position(pos)
    possible_positions = KnightPathFinder.valid_moves(pos)
    new_possible_positions = possible_positions.select {|el| !@considered_positions.include?(el)}
    new_possible_positions.each {|el| @considered_positions << el}
    new_possible_positions
  end

end