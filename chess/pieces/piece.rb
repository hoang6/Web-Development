# require_relative 'king'
# require_relative 'queen'
# require_relative 'bishop'
# require_relative 'pawn'
# require_relative 'knight'
# require_relative 'rook'
# require_relative 'stepping'
# require_relative 'sliding'

class Piece
  attr_reader :symbol, :color
  attr_accessor :pos

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def symbol
    raise "Must have a symbol"
  end

  def move_into_check?(pos)
    board_dup = @board.dup
    board_dup.move!(@pos, pos)

    board_dup.in_check?(@color)
  end

  def valid_moves
    self.moves.reject { |move| move_into_check?(move) }
  end

  def in_bound?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def blocked_by_self?(pos)
    !@board[pos].nil? && @board[pos].color == @color
  end

  def blocked_by_opp?(pos)
    !@board[pos].nil? && @board[pos].color != @color
  end

  def inspect
    "color: #{@color}, symbol: #{symbol}"
  end
end
