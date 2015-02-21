require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board.dup
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def winning_node?(evaluator)
    @board.winner == evaluator
  end

  def losing_node?(evaluator)
    if @board.over?
      return true if @board.winner == opposite_mark(@next_mover_mark)
      return false if @board.winner == @next_mover_mark || @board.winner == nil
    end
    if evaluator == @next_mover_mark
      children.each do |child_node|
        temp_eval = child_node.losing_node?(evaluator)
        return temp_eval if temp_eval != false
      end
      false
    else
      children.each do |child_node|
        temp_eval = child_node.losing_node?(evaluator)
        return temp_eval if temp_eval != true
      end
      true
    end
  end



  # This method generates an array of all moves that can be made after
  # the current move.

  def children
    children = []
    [0,1,2].each do |row|
      [0,1,2].each do |col|
        if @board[row,col].empty?
          new_move_board = @board.dup
          new_move_board.place_mark([row, col], @next_mover_mark)
          children << TicTacToeNode.new
            (new_move_board, oposite_mark(@next_mover_mark),[row, col])
        end
      end
    end
    children
  end


  def opposite_mark(mark)
    mark == :x ? :o : :x
  end

end
