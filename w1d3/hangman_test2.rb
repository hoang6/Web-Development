class Game
  def initialize(guesser, checker)
    @guesser = guesser
    @checker = checker
  end

  def play
    begin
      guess = @guesser.guess
      ok = @checker.check_guess(guess)
      guessing_word = @guesser.update_guess(guess) if ok

      display
    end while !guessing_word.include?("_")

    puts "You win!"
  end

  def display
    puts guessing_word.join
  end
end

class HumanPlayer
  def initialize
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
  end

  def word_bank(length)
    @word_bank = @dictionary.select { |word| word.length == length}
  end

  def pick_secret_word
    puts "Give word's length:"
    length = gets.chomp.to_i
    Array.new(length, '_')
  end

  def guess
    puts "Please enter a letter:"
    gets.chomp
  end

  def check_guess(guess)
    puts "Does the word contain #{guess}? Enter positions!"
    gets.chomp
  end

  def update_guess(guess)
    @secret_word.each_with_index do |letter, index|
      @hidden_word[index] = guess if guess == letter
    end

    new_word
  end
end

class ComputerPlayer

  def initialize
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
    @letters = ('a'..'z').to_a
    @secret_word = @dictionary[rand(@dictionary.count)].chars
    @guessing_word = Array.new(@secret_word.length, '_')

  end

  # def pick_secret_word
  #   @secret_word = @dictionary[rand(@dictionary.count)].chars
  # end
  #
  # def hidden_word(length)
  #   @guessing_word = Array.new(length, '_')
  # end

  def guess
    guess = @letters.sample
  end

  def check_guess(guess)
    @secret_word.include?(guess)
  end

  def update_guess(guess, positions)
    if !positions.nil?
      position_array = status.chars
      @letters.delete(guess)
    else
      @letters.delete(guess)
    end

    position_array.each do |position|
      @guessing_word[position] = guess
    end

    @guessing_word
  end
end


human = HumanPlayer.new
comp = ComputerPlayer.new


game = Game.new(human, comp)
game.play
