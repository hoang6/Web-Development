require 'byebug'
class KnightPathFinder

  attr_reader :visited_positions

  def initialize(position)
    @start_position = position
  end

  def self.valid_moves(position)
    valid_positions = []
    (-1..2).each do |x|
      (-1..2).each do |y|
        valid_positions << [(position[0] + x),(position[1] + y)]
      end
    end
    valid_positions
  end

  def new_move_positions(position)
    all_positions = KnightPathFinder.valid_moves(position)
    all_positions = all_positions.select do |pos|
      !@visited_positions.include?(pos) && valid_pos?(pos)
    end
    @visited_positions += all_positions

    all_positions
  end

  def valid_pos?(position)
    return false if (position[0] < 0 || position[0] > 7) || (position[1] < 0 || position[1] > 7)

    true
  end

  def build_move_tree
    @visited_positions = [@start_position.dup]

    @move_tree = PolyTreeNode.new(@start_position)
    queue = [@move_tree]

    while @visited_positions.length < 64
      current_node = queue.pop
      possible_moves = new_move_positions(current_node.value)
      possible_moves_nodes = create_nodes(possible_moves)

      possible_moves_nodes.each do |node|
        node.parent = current_node
        queue.unshift(node)
      end
    end
  end

  def create_nodes(positions)
    nodes = []
    positions.each do |pos|
      nodes << PolyTreeNode.new(pos)
    end

    nodes
  end

  def find_path(end_position)
    build_move_tree
    target_node = @move_tree.dfs(end_position)

    target_node.trace_path_back.reverse
  end
end

class PolyTreeNode

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if @parent != node
      if @parent != nil
        @parent.children.delete(self)
      end
      @parent = node
      node.children << self unless @parent.nil?
    end
  end

  def add_child(child_node)
    @children << child_node

    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Given node is not a child" if !@children.include?(child_node)
    child_node.parent = nil

    @children.delete(child_node)
  end

  def dfs(target_value)
    if self.value == target_value
      return self
    elsif @children.empty?
      return nil
    end
    @children.each do |child|
      local_result = child.dfs(target_value)
      return local_result if local_result != nil
    end

    nil
  end

  def bfs(target_value)
    queue = []
    queue << self

    loop do
      node = queue.pop
      if node.value == target_value
        return node
      end

      node.children.each do |child|
        queue.unshift(child)
      end
      return nil if queue.empty?
    end
  end

  def trace_path_back
    traces = []
    current_node = self

    until current_node.nil?
      traces << current_node.value
      current_node = current_node.parent
    end

    traces
  end

end


new_game = KnightPathFinder.new([0, 0])
p new_game.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p new_game.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


# p new_game.new_move_positions([1,2])
#
# p new_game.new_move_positions([2,1])
