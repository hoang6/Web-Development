require_relative './sliding.rb'

class Bishop < SlidingPieces
  def initialize(color, pos, board)
    super
  end

  def symbol
    symbols = { "black" => :♝,
                "white" => :♗ }

    symbols[color]
  end

  def move_dirs
    [[1, 1], [-1, 1], [1, -1], [-1, -1]]
  end
end
