class CompPlayer
  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
  end

  def play_turn
    begin
      piece = @board.pieces(@color).sample(1).first
      start_position = piece.pos
      end_position = piece.moves.sample(1).first
    end while end_position.nil? || !piece.valid_moves.include?(end_position)

    puts "Player #{@color}: #{start_position} -> #{end_position}"

    [start_position, end_position]
  end
end
