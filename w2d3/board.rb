# require_relative './pieces/piece.rb'
require_relative './pieces/king'
require_relative './pieces/queen'
require_relative './pieces/bishop'
require_relative './pieces/pawn'
require_relative './pieces/knight'
require_relative './pieces/rook'
require_relative './pieces/stepping'
require_relative './pieces/sliding'
require 'colorize'

class Board
  class InvalidMoveError < StandardError ; end

  attr_reader :grid

  def initialize(place_pieces = true)
    @grid = Array.new(8) { Array.new(8) }
    build_board if place_pieces
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def in_check?(color)
    king = find_king(color)

    king_pos = king.pos
    other_color = (color == 'white' ? 'black' : 'white')

    pieces(other_color).each do |piece|
      return true if piece.moves.include?(king_pos)
    end

    false
  end

  def check_mate?(color)
    # return false unless in_check?(color) # this actually causes problem!

    pieces(color).all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def find_king(color)
    all_pieces.select { |piece| piece.color == color && piece.is_a?(King) }.first
  end

  def all_pieces
    @grid.flatten.compact
  end

  # def inspect
  #   "this board"
  # end

  def pieces(color)
    all_pieces.select do |piece|
      piece.color == color
    end
  end

  def dup
    new_board = Board.new(false)
    all_pieces.each do |piece|
      new_piece = piece.class.new(piece.color, piece.pos, new_board)
      new_board[new_piece.pos] = new_piece
    end

    new_board
  end

  def move(color, start_pos, end_pos)

    current_piece = self[start_pos]
    raise InvalidMoveError.new('wrong piece, please choose again!') if color != current_piece.color
    raise InvalidMoveError.new('invalid move!') unless current_piece.in_bound?(end_pos)
    raise InvalidMoveError.new('position is occupied') if current_piece.blocked_by_self?(end_pos)

    possible_moves = current_piece.valid_moves

    raise InvalidMoveError.new('invalid move') unless possible_moves.include?(end_pos)

    if possible_moves.include?(end_pos)
      self[start_pos] = nil
      current_piece.pos = end_pos
      self[end_pos] = current_piece
    end

    if current_piece.is_a?(Pawn) && current_piece.promotion?(color)
      self[end_pos] = Queen.new(color, end_pos, self)
    end

    p self.display
  end

  def move!(start_pos, end_pos)

    current_piece = self[start_pos]
    possible_moves = current_piece.moves

    if possible_moves.include?(end_pos)
      self[start_pos] = nil
      current_piece.pos = end_pos
      self[end_pos] = current_piece
    end
  end

  def build_board
    #black and white pawns
    (0..7).each do |col|
      pos = [1, col]
      self[pos] = Pawn.new('black', pos, self)
      pos = [6, col]
      self[pos] = Pawn.new('white', pos, self)
    end

    #black and white rooks
    self[[0, 0]] = Rook.new('black', [0, 0], self)
    self[[0, 7]] = Rook.new('black', [0, 7], self)
    self[[7, 0]] = Rook.new('white', [7, 0], self)
    self[[7, 7]] = Rook.new('white', [7, 7], self)

    #black and white knights
    self[[0, 1]] = Knight.new('black', [0, 1], self)
    self[[0, 6]] = Knight.new('black', [0, 6], self)
    self[[7, 1]] = Knight.new('white', [7, 1], self)
    self[[7, 6]] = Knight.new('white', [7, 6], self)

    #black and white bishops
    self[[0, 2]] = Bishop.new('black', [0, 2], self)
    self[[0, 5]] = Bishop.new('black', [0, 5], self)
    self[[7, 2]] = Bishop.new('white', [7, 2], self)
    self[[7, 5]] = Bishop.new('white', [7, 5], self)

    #black and white queen and king
    self[[0, 3]] = Queen.new('black', [0, 3], self)
    self[[7, 3]] = Queen.new('white', [7, 3], self)
    self[[0, 4]] = King.new('black', [0, 4], self)
    self[[7, 4]] = King.new('white', [7, 4], self)
  end

  def render
    new_str = '  ' << ('a'..'h').to_a.join('  ') << "\n"
    @grid.each_with_index do |row, row_index|
      new_str << row_index.to_s + " "
      row.each_with_index do |piece, col_index|

        if (row_index.even? && col_index.even?) || (row_index.odd? && col_index.odd?)
          if piece.nil?
            new_str << (' ' + '  ')#.colorize(:background => :white)
          else
            new_str << (' ' + piece.symbol.to_s + ' ')#.colorize(:background => :white)
          end
        else
          if piece.nil?
            new_str << (' ' + '  ').colorize(:background => :light_black)
          else
            new_str << (' ' + piece.symbol.to_s + ' ').colorize(:background => :light_black)
          end
        end
      end
      new_str << "\n"
    end

    new_str
  end

  def render_possible_moves(moves)

    new_str = '  ' << ('a'..'h').to_a.join('  ') << "\n"

    @grid.each_with_index do |row, row_index|
      new_str << row_index.to_s + " "
      row.each_with_index do |piece, col_index|

        if (row_index.even? && col_index.even?) || (row_index.odd? && col_index.odd?)
          if piece.nil?
            if moves.include?([row_index, col_index])
              new_str << (' ' + '  ').colorize(:background => :light_green)
            else
              new_str << (' ' + '  ')
            end
          else
            if moves.include?([row_index, col_index])
              new_str << (' ' + piece.symbol.to_s + ' ').colorize(:background => :light_green)
            else
              new_str << (' ' + piece.symbol.to_s + ' ')
            end
          end
        else
          if piece.nil?
            if moves.include?([row_index, col_index])
              new_str << (' ' + '  ').colorize(:background => :light_green)
            else
              new_str << (' ' + '  ').colorize(:background => :light_black)
            end
          else
            if moves.include?([row_index, col_index])
              new_str << (' ' + piece.symbol.to_s + ' ').colorize(:background => :light_green)
            else
              new_str << (' ' + piece.symbol.to_s + ' ').colorize(:background => :light_black)
            end
          end
        end
      end
      new_str << "\n"
    end

    new_str
  end

  def display
    puts render
  end
end
