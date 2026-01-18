require_relative 'board'
require_relative 'player'

class Game
  def initialize
    puts "What is Player 1's (X) Name?"
    name1 = gets
    @player1 = Player.new(name1.chomp)
    puts "What is Player 2's (O) Name?"
    name2 = gets
    @player2 = Player.new(name2.chomp)
    @board = Board.new(@player_1, @player_2)
    @turn = 0
  end

  def play_game
    loop do
      take_turn
      result = @Board.declare_end
      if result.is_a?(Player)
        return "The winner is: #{result.name}!"
      elsif result == 'Tie'
        return "It's a draw!"
      end
    end
  end

  private

  def take_turn
    @board.display_board
    cur_player = player_move
    location = loop do
      puts "#{cur_player.name}, please enter the cell you would like to place your marker in (1-9)"
      response = gets.chomp
      break response.to_i if @board.valid?(response.to_i)

      puts 'Please enter a valid cell (1-9) that is not already occupied.'
    end
    @board.place_mark(cur_player, location)
  end

  def player_move
    return @player1 if @turn.even?

    @player2
  end
end
