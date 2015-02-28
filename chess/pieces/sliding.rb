require_relative './piece.rb'

class SlidingPieces < Piece
  def moves
    possible_moves = []
    self.move_dirs.each do |dir|
      possible_moves += moves_in_dir(dir)
    end
    possible_moves
  end

  def moves_in_dir(dir)
    possible_moves = []
    d1, d2 = dir
    new_pos = [@pos[0], @pos[1]]

    loop do
      new_pos = [new_pos[0] + d1, new_pos[1] + d2]

      break unless in_bound?(new_pos)

      if self.blocked_by_opp?(new_pos)
        possible_moves << new_pos
        break
      end

      if self.blocked_by_self?(new_pos)
        break
      end

      possible_moves << new_pos
    end
    possible_moves
  end
end
