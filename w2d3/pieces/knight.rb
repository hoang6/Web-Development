require_relative './stepping.rb'

class Knight < SteppingPieces
  def initialize(color, pos, board)
    super
  end

  def symbol
    symbols = { "black" => :♞,
                "white" => :♘ }

    symbols[color]
  end

  def move_dirs
    [[1, -2], [2, -1], [1, 2], [2, 1],
    [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end
end
