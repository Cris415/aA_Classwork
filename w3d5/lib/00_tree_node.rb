class PolyTreeNode
  attr_reader :value, :parent, :children
  attr_writer :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if !@parent.nil?
      child_index = @parent.children.index(self)
      @parent.children.delete_at(child_index)
    end
    
    @parent = node

    if !@parent.nil? && !@parent.children.include?(self)
      @parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "node is not a child" if child_node.parent.nil?
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if target_value == self.value
    self.children.each do |child|
      search_result = child.dfs(target_value)
      if !search_result.nil?
        return search_result
      end
    end
    nil
  end
      #[a] 7
  #[b]    [c]
#[d][e]  [f][g]

  def bfs(target_value)
    queue = [self]

    until queue.empty?
        next_up = queue.shift 

        queue.concat(next_up.children) #[first, second, third] + [ b, c]
        if next_up.value == target_value
          return next_up 
        end
    end
    nil
  end



  def inspect
    # parent = #{self.parent}
    "value = #{self.value} "
  end

end

