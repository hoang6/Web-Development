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

end

a = PolyTreeNode.new('a')
b = PolyTreeNode.new('b')
c = PolyTreeNode.new('c')

b.parent = a
c.parent = a

p c.dfs('c')
