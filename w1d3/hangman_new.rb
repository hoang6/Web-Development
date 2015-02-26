class HangMan
  attr_accessor :max_plays, :play

  def initialize(guesser, checker)
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)

    @guesser = guesser
    @checker = checker
    max_plays = 10
    play = 1
  end

  def run
    puts "Please make a guess!"

    secret_word = @checker.pick_secret_word
    word_length = @guesser.receive_secret_length(secret_word)
    word = Array.new(secret_word.length, '_')

    guess = @guesser.guess
    word = @checker.handle_guess_response(guess)

    while  word != secret_word && play <= max_plays
      guess = @guesser.guess
      word = @checker.handle_guess_response(guess)

      play += 1
    end

    if !word.include?('_')
      puts "Congrats, you won! Secret word is #{secret_word}."
    else
      puts "You lost! Secret word is #{secret_word}."
    end
  end
end

game = HangMan.new('dictionary.txt')
game.run

class HumanPlayer
  def pick_secret_word

  end

  def receive_secret_length(length)
    @word = Array.new(length, '_')
  end

  def guess
    gets.chomp
  end

  def check_guess
  end

  def handle_guess_response
  end
end

class ComputerPlayer
  attr_reader :secret_word

  def pick_secret_word
    @dictionary = @dictionary.shuffle
    @secret_word = @dictionary[rand(@dictionary.length)]
    # puts "Play ##{play}. Please make a guess!"
  end

  def receive_secret_length(length)
    @length = length
  end

  def guess

  end

  def check_guess(guess)
    return true if @secret_word.include?(guess)
    false
  end

  def handle_guess_response(guess)
    if check_guess(guess) == true
      @secret_word.chars.each_with_index do |letter, index|
        if guess == letter
          @word[index] = letter
        end
      end
    elsif
      puts "Nope, try again!"
    end

    @word.join
  end
end


human = HumanPlayer.new
computer = Computer.new

game = HangMan.new(human, computer)
game.play
