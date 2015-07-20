class Deck
  attr_accessor :cards

  def initialize(number_of_decks = 1)
    @number_of_decks = number_of_decks
    @cards = []

    ranks = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
    suits = %w{ Spades Hearts Diamonds Clubs }
    
    @number_of_decks.times do
      suits.each do |suit|
        (ranks.size).times do |i|
          @cards.push(Card.new(ranks[i], suit, (i + 1)))
        end
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end
