class HumanPlayer
  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
  end

  def play_turn

    puts "player: #{color}, choose a chessman"
    input = gets.chomp.split(',')

    row_start = input[0].to_i
    col_start = letter_to_number(input[1]).to_i
    start_position = [row_start, col_start]

    suggested_moves = @board[start_position].valid_moves

    puts @board.render_possible_moves(suggested_moves)

    print 'possible moves:'
    suggested_moves.each do |move|
      print "[#{move[0]}, #{number_to_letter(move[1])}]"
    end

    puts "\nmove to"
    input = gets.chomp.split(',')

    row_end = input[0].to_i
    col_end = letter_to_number(input[1]).to_i
    end_position = [row_end, col_end]

    [start_position, end_position]
  end

  def letter_to_number(key)
    numbers = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3,
                'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7}

    numbers[key]
  end

  def number_to_letter(key)
    letters = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd',
                4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h'}

    letters[key]
  end
end
