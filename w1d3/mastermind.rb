class Game
  def play
    @computer_code = Code.random
    p @computer_code
    turns = 0
    win = false

    until win || turns == 10
      player_code = create_player_code
      win = match_status(player_code)

      turns += 1
    end

    puts win ? "You won!" : "You lost!"
  end

  def match_status(player_code)
    exact_matches, near_matches = @computer_code.find_matches(player_code)
    puts "Exact Matches: #{exact_matches}. Near Matches: #{near_matches}."

    exact_matches == 4
  end

  def create_player_code
    print "Please enter a guess: "
    guesses = gets.chomp.chars

    create_code(guesses)
  end

  def create_code(guesses)
    Code.new(guesses)
  end
end

class Code
  COLORS = %w(R G B Y P O)
  attr_accessor :pegs

  def initialize(coded_guesses)
    @pegs = coded_guesses
  end

  def self.random
    shuffled_pegs = []
    4.times { shuffled_pegs << COLORS.sample }
    Code.new(shuffled_pegs)
  end

  def find_matches(other_code)
    my_pegs = @pegs.dup
    other_pegs = other_code.pegs.dup

    exact_matches = find_exact_matches(my_pegs, other_pegs)
    near_matches = find_near_matches(my_pegs, other_pegs)

    [exact_matches, near_matches]
  end

  def find_exact_matches(my_pegs, other_pegs)
    exact_matches = 0

    index = my_pegs.length - 1
    while index >= 0
      if my_pegs[index] == other_pegs[index]
        exact_matches += 1
        my_pegs.delete_at(index)
        other_pegs.delete_at(index)
      end
      index -= 1
    end

    p "After Exact matches: #{my_pegs}, #{other_pegs}"
    exact_matches
  end

  def find_near_matches(my_pegs, other_pegs)
    near_matches = 0

    index = my_pegs.length - 1
    while index >= 0
      my_peg = my_pegs[index]
      if other_pegs.include?(my_peg)
        near_matches += 1
        other_pegs.delete(my_peg)
        my_pegs.delete(my_peg)
      end
      index -= 1
    end

    near_matches
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
