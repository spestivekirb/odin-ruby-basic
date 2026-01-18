# frozen_string_literal: true

require_relative 'player'

class Board # rubocop:disable Style/Documentation
  attr_reader :turn

  def initialize(player_one, player_two)
    @x_player = player_one
    @o_player = player_two
    @board = Array.new(3) { |row| Array.new(3) { |col| (row * 3 + col + 1).to_s } }
  end

  def valid?(location)
    col = (location.to_i - 1) % 3
    row = ((location.to_i - 1) / 3).floor
    location.to_i >= 1 && location.to_i <= 9 && @board[row][col] != 'X' && @board[row][col] != 'O'
  end

  def place_mark(player, location)
    marker = 'X' if player == @x_player
    marker = 'O' if player == @o_player
    col = (location - 1) % 3
    row = ((location - 1) / 3).floor
    @board[row][col] = marker
  end

  def display_board
    puts '----------'
    @board.each_with_index do |row, index|
      puts "#{@board[row].join(' | ')}}"
      puts '----------' unless index == 2
    end
  end

  def declare_end
    # Check Row and Columns
    3.times do |index|
      return @x_player if @board[index] == %w[X X X]
      return @o_player if @board[index] == %w[O O O]
      return @x_player if @board[0][index] == 'X' && @board[1][index] == 'X' && @board[2][index] == 'X'
      return @o_player if @board[0][index] == 'O' && @board[1][index] == 'O' && @board[2][index] == 'O'
    end
    # Check diagonals
    return @x_player if @board[0][0] == 'X' && @board[1][1] == 'X' && @board[2][2] == 'X'
    return @o_player if @board[0][0] == 'O' && @board[1][1] == 'O' && @board[2][2] == 'O'
    return @x_player if @board[0][2] == 'X' && @board[1][1] == 'X' && @board[2][0] == 'X'
    return @o_player if @board[0][2] == 'O' && @board[1][1] == 'O' && @board[2][0] == 'O'
    # Check for full board
    return 'Tie' if @board.flatten.all? { |cell| %w[X O].include?(cell) }

    'Unfinished'
  end
end
