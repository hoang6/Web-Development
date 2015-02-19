class Hangman
  def initialize(guesser, checker)
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


    @guesser.pick

    if @guesser.is_a?(HumanPlayer)



      # secret_word = @checker.pick_secret_word
      # @word_so_far = Array.new(secret_word.length, '_')
      #
      # while secret_word != @word_so_far
      #   input = @guesser.generate_input
      #   evaluate_human_input(input)
      #   render
      # end
      #
      # puts "You win!"
    elsif @guesser.is_a?(ComputerPlayer)
      @checker.pick_word_length


    end
  end

  private

  def evaluate_human_input(input)
    input.each do |let1|
      secrete_word_array = @checker.secret_word.chars
      secrete_word_array.each_with_index do |let2, idx|
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

  def pick

  end

  def pick_word_length
    puts "Enter word's length:"
    @secret_word_length = gets.chomp.to_i
  end

  def generate_input
    puts "Enter a word or letter:"
    gets.chomp.chars
  end
end

class ComputerPlayer
  attr_reader :secret_word

  def initialize
    @dictionary_words = File.readlines("dictionary.txt").map(&:chomp)
  end

  def pick_secret_word
    @secret_word = @dictionary_words[rand(@dictionary_words.count)]
  end
end

human1 = Human.new
human2 = Human.new
computer = Computer.new
computer2 = Computer.new
game = Hangman.new(computer, human2)
game.play
