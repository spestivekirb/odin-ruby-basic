require_relative 'generator'

class Game
  def initialize(load)
    if load
      puts 'load'
    else
      @used_set = []
      @wrong_set = []
      gen = Generator.new
      @solution = gen.generate_word.split('')
      @contain_set = @solution.uniq
      @lives = 6
    end
  end

  def play_game
    while @lives.positive? && @contain_set.length.positive?
      display
      guess
    end
  end

  private

  def guess
    letter = loop do
      puts 'Please guess a letter.'
      input = gets.chomp
      break input if input.length == 1 && input.downcase.between?('a', 'z') && !@used_set.include?(input.downcase)

      puts 'Invalid input. Please enter a single, alphabetical letter (a-z), that has not already been guessed.'
    end
    @used_set.push(letter.downcase)
    if @contain_set.include?(letter.downcase)
      @contain_set.delete(letter.downcase)
    else
      @wrong_set.push(letter.downcase)
    end
  end

  def display
    puts "Lives remaining: #{@lives}"
    guess_string = ''
    @solution.each_with_index do |letter, index|
      if @used_set.include?(letter)
        guess_string += "#{letter.upcase} " if index.zero?
        guess_string += "#{letter} " if index != 0
      else
        guess_string += '_ '
      end
    end
    puts guess_string
    puts "Incorrect guesses: #{@wrong_set}"
  end
end
