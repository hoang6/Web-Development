require_relative './piece.rb'

class SteppingPieces < Piece
  def moves
    possible_moves = []

    self.move_dirs.each do |dir|
      d1, d2 = dir
      new_pos = [@pos[0] + d1, @pos[1] + d2]

      next unless self.in_bound?(new_pos)
      next if blocked_by_self?(new_pos)
      possible_moves << new_pos
    end

    possible_moves
  end
end
