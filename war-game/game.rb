class Game
  def initialize(deck, player1, player2)
    @deck = deck
    @stack = []
    @player1 = player1
    @player2 = player2
  end

  def play
    @deck.shuffle
    # deal the cards
    (@deck.cards.size / 2).times do
      @player1.cards.push(@deck.draw)
      @player2.cards.push(@deck.draw)
    end

    puts "Deck size: #{@deck.cards.size}."
    puts "Player 1 deck size: #{@player1.cards.size}."
    puts "Player 2 deck size: #{@player2.cards.size}."
    puts ""
    puts "Player1 cards\tPlayer2 cards\tStack\t#{@player1.name}\t#{@player2.name}\tResult"

    battles = wars = 0
    # play until someone runs out of cards

    loop do
      battles += 1
      @stack << @player1.cards.pop << @player2.cards.pop
      result = @stack[-2] <=> @stack[-1]
      puts "#{@player1.cards.length}\t#{@player2.cards.length}\t
            #{@stack.length}\t#{@stack[-2].to_s}\t#{@stack[-1].to_s}\t#{result}"

      case result

      when -1 # player2 takes the stack
        @stack.shuffle! # prevent infinite loop
        @player2.cards.unshift(@stack).flatten!
        @stack.clear
      when 1 # player1 takes the stack
        @stack.shuffle! # prevent infinite loop
        @player1.cards.unshift(@stack).flatten!
        @stack.clear
      when 0 # there is a war
        wars += 1
        @stack << @player1.cards.pop << @player2.cards.pop
      end

      if @player1.cards.empty?
        puts "Player 2 has won the game."
        break
      elsif @player2.cards.empty?
        puts "Player 1 has won the game."
        break
      else
        if battles > 5000
          puts "Draw game"
          break
        end
      end
    end

    puts "There was #{battles} battles and #{wars} wars."
  end
end
