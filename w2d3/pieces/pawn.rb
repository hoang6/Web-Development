require_relative './piece.rb'

class Pawn < Piece
  def initialize(color, pos, board)
    super
  end

  def symbol
    symbols = { 'black' => :♟,
                'white' => :♙ }

    symbols[color]
  end

  def moves

    killing_moves(@color) + vertical_moves(@color)
  end

  def killing_moves(color)
    possible_moves = []

    row_step = (color == 'white' ? -1 : 1)
    dirs = [[row_step, -1], [row_step, 1]]

    dirs.each do |dir|
      row, col = dir
      new_pos = [@pos[0] + row, @pos[1] + col]

      possible_moves << new_pos if self.blocked_by_opp?(new_pos)
    end

    possible_moves
  end

  # def vertical_moves(color)
  #   possible_moves = []
  #
  #   row_step = (color == 'white' ? -1 : 1)
  #
  #   distance = 1
  #
  #   new_pos = [@pos[0], @pos[1]]
  #
  #   if (color == 'white' && @pos[0] == 6) || (color == 'black' && @pos[0] == 1)
  #     distance += 1
  #   end
  #
  #   counter = 0
  #   while counter < distance
  #     new_pos = [new_pos[0] + row_step, new_pos[1]]
  #     break unless in_bound?(new_pos)
  #     break unless @board[new_pos].nil?
  #     # break if self.blocked_by_self?(new_pos)
  #     # break if self.blocked_by_opp?(new_pos)
  #
  #     possible_moves << new_pos
  #
  #     counter += 1
  #   end
  #
  #   possible_moves
  # end

  def vertical_moves(color)
    possible_moves = []

    row_step = (color == 'white' ? -1 : 1)

    current_pos = [@pos[0], @pos[1]]
    short_move = [@pos[0] + row_step, @pos[1]]
    long_move = [@pos[0] + 2 * row_step, @pos[1]]

    if (color == 'white' && @pos[0] == 6) || (color == 'black' && @pos[0] == 1)
      jump_allowed = true
    end

    if in_bound?(short_move) && @board[short_move].nil?
      possible_moves << short_move
      possible_moves << long_move if jump_allowed && @board[short_move].nil?
    end

    possible_moves
  end

  def promotion?(color)
    if (color == 'white' && @pos[0] == 0) || (color == 'black' && @pos[0] == 7)
      return true
    end

    false
  end


end
