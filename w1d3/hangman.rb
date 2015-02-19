class Hangman
  def initialize(role)
    human = HumanPlayer.new
    comp = ComputerPlayer.new
    if role == 'guesser'
      @guesser = human
      @checker = comp
    elsif role == 'checker'
      @guesser = comp
      @checker = human
    end
  end

  def play
    # if @checker.is_a?(ComputerPlayer)
    #   @secret_word = @checker.pick_secret_word.chars
    # elsif @check.is_a?(HumanPlayer)
    #
    # end
    # @word_so_far = Array.new(@secret_word.length, '_')
    #
    # while @secret_word != @word_so_far
    #     input = @guesser.generate_input
    #     evaluate_input(input)
    #     render
    # end
    #
    # puts "You win!"
  end

  def evaluate_input(input)
    input.each do |let1|
      @secret_word.each_with_index do |let2, idx|
        @word_so_far[idx] = let1 if let1 == let2
      end
    end
  end

  def render
    puts @word_so_far.join
  end

end

class HumanPlayer
  # def initialize
  # end

  def pick_secret_word
    puts "Enter word's length:"
    @secret_word_length = gets.chomp.to_i
  end

  def generate_input
    puts "Enter a word or letter:"
    gets.chomp.chars
  end
end

class ComputerPlayer
  def initialize
    @dictionary_words = File.readlines("dictionary.txt").map(&:chomp)
  end

  def pick_secret_word
    @secret_word = @dictionary_words[rand(@dictionary_words.count)]
  end
end

# game = Hangman.new(human, comp)
# game.play
