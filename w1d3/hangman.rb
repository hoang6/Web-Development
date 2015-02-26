class HangMan
  def initialize(dictionary)
    @dictionary = File.readlines(dictionary).map(&:chomp)
  end

  def run
    @dictionary = @dictionary.shuffle
    secret_word = @dictionary[rand(@dictionary.length)]
    max_plays = 10
    play = 1
    word = Array.new(secret_word.length, '_')

    while word.join != secret_word && play <= max_plays
      puts word.join
      puts "Play ##{play}. Please make a guess!"
      guess = gets.chomp

      if secret_word.include?(guess)
        secret_word.chars.each_with_index do |letter, index|
          if guess == letter
            word[index] = letter
          end
        end
      else
        puts "Nope!"
      end

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

  def receive_secret_length
  end

  def guess
  end

  def check_guess
  end

  def handle_guess_response
  end
end

class ComputerPlayer
  attr_reader :secret_word

  def pick_secret_word
    secret_word = @dictionary[rand(@dictionary.length)]
  end

  def receive_secret_length
  end

  def guess
  end

  def check_guess
  end

  def handle_guess_response
  end
end
