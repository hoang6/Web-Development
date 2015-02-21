require '00_tree_node'

class KnightPathFinder


  def initialize(position)
    @start_position = position
    @visited_positions = @start_position.dup
  end

  def

  def move_tree

  end

  def find_path

  end

  def build_move_tree
    @move_tree = PolyTreeNode.new(@start_position)
  end

  def self.valid_moves(pos)
    valid_moves = []
    valid_moves << [(pos[0] - 1),(pos[0] + 2)]
    valid_moves << [(pos[0] + 1),(pos[0] + 2)]
    valid_moves << [(pos[0] + 2),(pos[0] + 1)]
    valid_moves << [(pos[0] + 2),(pos[0] - 1)]
    valid_moves << [(pos[0] + 1),(pos[0] - 2)]
    valid_moves << [(pos[0] - 1),(pos[0] - 2)]
    valid_moves << [(pos[0] - 2),(pos[0] - 1)]
    valid_moves << [(pos[0] - 2),(pos[0] + 1)]
  end

  def new_move_positions(pos)
    valid_moves = self.valid_moves(pos)

    valid_moves.each do |move|
      if @visited_positions.include?(move)
        valid_moves.delete(move)
      end
    end

    #add new positions into @visited_positions
    valid_moves.each do |move|
      @visited_positions << move
    end
    valid_moves
  end

end
