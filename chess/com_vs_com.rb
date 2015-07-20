require_relative 'board'
require_relative 'human_player'

 class Game
   def initialize
     @board = Board.new
     @player1 = HumanPlayer.new('white', @board)
     @player2 = HumanPlayer.new('black', @board)
     @current_player = @player1
   end

   def play

     until @board.check_mate?('white') || @board.check_mate?('black')
       begin
         piece = @board.pieces(@current_player.color).sample(1).first
         start_pos = piece.pos
         end_pos = piece.moves.sample(1).first
       end while end_pos.nil? || !piece.valid_moves.include?(end_pos)

       puts "#{@current_player.color} from #{start_pos} to #{end_pos}"

       @board.move(@current_player.color, start_pos, end_pos)

       @current_player = (@current_player.color == 'white' ? @player2 : @player1 )


       sleep(1.0 / 1)
     end

     if @board.check_mate?('white')
       puts 'checkmate, white lost!'
     elsif @board.check_mate?('black')
       puts 'checkmate black lost!'
     else
       puts 'deuce!'
     end

   end
 end

 game = Game.new
 game.play
