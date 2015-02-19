class Game
  def play
    @computer_code = Code.random_pegs

    turns = 0
    perfect_match = false

    until perfect_match || turns == 10
      player_guess = taking_guess
      perfect_match = matched?(player_guess)

      turns += 1
    end

    puts perfect_match ? "You won!" : "You lost!"
  end

  def matched?(player_guess)
    exact_matches, near_matches = @computer_code.find_matches(player_guess)
    puts "Exact Matches: #{exact_matches}| Near Matches: #{near_matches}."

    exact_matches == 4
  end

  def taking_guess
    print "Enter a guess:"
    guess = gets.chomp.upcase.chars

    Code.new(guess)
  end
end

class Code
  COLORS = %w(R G B Y P O)
  attr_reader :pegs

  def initialize(guess)
    @pegs = guess
  end

  def self.random_pegs
    shuffled_pegs = []
    4.times { shuffled_pegs << COLORS.sample }
    Code.new(shuffled_pegs)
  end

  def find_matches(other_code)
    comp_pegs = @pegs.dup
    other_pegs = other_code.pegs.dup

    exact_matches = find_exact_matches(comp_pegs, other_pegs)
    near_matches = find_near_matches(comp_pegs, other_pegs)

    [exact_matches, near_matches]
  end

  def find_exact_matches(comp_pegs, other_pegs)
    exact_matches = 0

    index = comp_pegs.length - 1
    while index >= 0
      if comp_pegs[index] == other_pegs[index]
        exact_matches += 1
        comp_pegs.delete_at(index)
        other_pegs.delete_at(index)
      end
      index -= 1
    end

    exact_matches
  end

  def find_near_matches(comp_pegs, other_pegs)
    near_matches = 0

    index = comp_pegs.length - 1
    while index >= 0
      my_peg = comp_pegs[index]
      if other_pegs.include?(my_peg)
        near_matches += 1
        other_pegs.delete(my_peg)
        comp_pegs.delete(my_peg)
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
