require_relative './stepping.rb'

class King < SteppingPieces
  def initialize(color, pos, board)
    super
  end

  def symbol
    symbols = { "black" => :♚,
                "white" => :♔ }

    symbols[color]
  end

  def move_dirs
    [[1, 1], [-1, 1], [1, -1], [-1, -1],
     [0, 1], [-1, 0], [0, -1], [1, 0]]
  end
end
