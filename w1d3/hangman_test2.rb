class Game
  def initialize(guesser, checker)
    @guesser = guesser
    @checker = checker
  end

  def play
    @word_so_far = @checker.pick_secret_word
    puts length = @word_so_far.length

    while @word_so_far.include?("_")
      guess = @guesser.guess
      @word_so_far = @checker.check_guess(guess, @word_so_far)
      display
    end

    puts "You win!"
  end

  def display
    puts @word_so_far.join
  end
end

class Human
  def pick_secret_word
    puts "Give word's length:"
    length = gets.chomp.to_i
    Array.new(length, '_')
  end

  def guess
    puts "Please enter a letter:"
    gets.chomp
  end

  # def check_guess()
  #
  # end
end

class Computer

  def initialize
    @dictionary_words = File.readlines("dictionary.txt").map(&:chomp)
  end

  def pick_secret_word
    @secret_word = @dictionary_words[rand(@dictionary_words.count)].chars
    Array.new(@secret_word.length, '_')
  end

  def check_guess(guess, prev_word)
    new_word = prev_word
    @secret_word.each_with_index do |letter, index|
      new_word[index] = guess if guess == letter
    end
    new_word
  end
end


human = Human.new
comp = Computer.new

game = Game.new(human, comp)
game.play
