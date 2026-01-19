class Player
  def initialize(state)
    @state = state # 0 if creator, 1 if guesser
  end

  def guess_code
    puts 'Please guess the code (given as a 4-digit number, numbers 1-6)'
    loop do
      guess = gets.chomp.split('')
      break unless guess.length == 4 || guess.between?('1', '6')

      puts 'Invalid input. Enter your answer as xxxx : 1 <= x <= 6'
    end
    guess
  end

  def create_code
    puts 'Hello World'
  end
end
