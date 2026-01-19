require_relative 'board'
require_relative 'computer'
require_relative 'player'

class Game
  attr_reader :turn

  def initialize
    if ask_state == 'CB'
      @guesser = Player.new(1) # Human guesser
      @maker = Computer.new(0)
    else
      @guesser = Computer.new(1)
      @maker = Player.new(0) # Human codemaker
    end
    @board = Board.new(make_code)
    @turn = 1
    @complete = false
  end

  def play_round
    puts "Turn: #{@turn}"
    guess = @guesser.guess_code
    # print "Guess: #{guess}"
    result = @board.guess(guess)
    @board.display(guess, result)
    @complete = true if @board.solved?(result)
    # print result
    @turn += 1
    sleep(5) if @guesser.is_a?(Computer)
  end

  def play_game
    if @guesser.is_a?(Player)
      play_round while @turn < 13 && !@complete
      if @complete
        puts "Congratulations! #{@board.solution} was the code!"
      else
        puts "Too bad. #{@board.solution} was the code!"
      end
    else
      play_round while @turn < 13 && !@complete
      if @complete
        puts "You lost! #{@board.solution} was the code!"
      else
        puts "You win! The computer could not guess your code: #{@board.solution}!"
      end
    end
  end

  private

  def ask_state
    loop do
      puts 'Would you like to be the codebreaker (CB) or codemaker (CM)?'
      player_state = gets.chomp
      return player_state.upcase if %w[CB CM].include?(player_state.upcase)

      puts "Invalid input. Please input 'CB' or 'CM'"
    end
  end

  def make_code
    code = @maker.create_code
    @guesser.set_answer(code) if @guesser.is_a?(Computer)
    code
  end
end
