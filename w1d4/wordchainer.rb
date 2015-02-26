require 'set'

class WordChainer
  def initialize(dictionary)
    @dictionary = File.readlines(dictionary).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  def adjacent_words(word)
    adjacent_words = []

    # word.chars.each_with_index do |old_letter, pos|
    #   ('a'..'z').each do |new_letter|
    #
    #     new_word = word.dup
    #     new_word[pos] = new_letter
    #
    #     next if new_word == word
    #
    #     @adjacent_words << new_word if @dictionary.include?(new_word)
    #   end
    # end

    (0...word.length).each do |pos|
      ('a'..'z').each do |new_letter|

        new_word = word.dup
        new_word[pos] = new_letter
        next if new_word == word

        # If we don't used include? here, it will be tricky
        adjacent_words << new_word if @dictionary.include?(new_word)
      end
    end
    adjacent_words
  end

  def run(source, target)
    @current_words = [source]
    # @all_seen_words = []
    @all_seen_words = {source => nil}

    while !@current_words.empty?
      break if @all_seen_words.include?(target)
      @current_words = explore_current_words
    end

    build_path(target)
  end

  def explore_current_words
    new_current_words = []

    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        next if @all_seen_words.has_key?(adjacent_word)

        new_current_words << adjacent_word
        # @all_seen_words << adjacent_word

        @all_seen_words[adjacent_word] = current_word
      end
    end

    new_current_words.each do |word|
      print "#{word} from #{@all_seen_words[word]} |"
    end
    new_current_words
  end

  def build_path(target)
    path = [target]

    until @all_seen_words[target].nil?
      target = @all_seen_words[target]
      path << target
    end
    path.reverse
  end

end

game = WordChainer.new('dictionary.txt')
# p game.adjacent_words('marker')
p game.run('duck', 'ruby')
