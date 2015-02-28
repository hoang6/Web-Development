require_relative 'board'
require_relative 'human_player'
require_relative 'comp_player'

 class Game
   def initialize
     @board = Board.new
     @player1 = HumanPlayer.new('white', @board)
     @player2 = CompPlayer.new('black', @board)
     @current_player = @player1
   end

   def play
     until @board.check_mate?('white') || @board.check_mate?('black')
       @board.display
       start_pos, end_pos = @current_player.play_turn

       @board.move(@current_player.color, start_pos, end_pos)
       @current_player = (@current_player.color == 'white' ? @player2 : @player1 )

       if @board.in_check?(@current_player.color)
         puts 'check, be careful, protect your dear King!'
       end
     end

     if @board.check_mate?('white')
       puts 'checkmate, white lost!'
     else
       puts 'checkmate black lost!'
     end

   rescue => e
     p e
     retry

   end
 end

 game = Game.new
 game.play
