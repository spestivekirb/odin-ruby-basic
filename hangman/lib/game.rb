require_relative 'generator'
require 'yaml'

class Game
  def initialize
    @used_set = []
    @wrong_set = []
    gen = Generator.new
    @solution = gen.generate_word.split('')
    @contain_set = @solution.uniq
    @lives = 6
  end

  def play_game
    while @lives.positive? && @contain_set.length.positive?
      display
      guess
    end
    if @lives.positive?
      puts "You win! The answer was: #{@solution.join.capitalize}"
    else
      puts "You lose! The answer was: #{@solution.join.capitalize}"
    end
  end

  private

  def guess
    letter = loop do
      puts 'Please guess a letter, or enter "save" to save and exit (will overwrite save).'
      input = gets.chomp
      save_game if input.downcase == 'save'
      break input if input.length == 1 && input.downcase.between?('a', 'z') && !@used_set.include?(input.downcase)

      puts 'Invalid input. Please enter a single, alphabetical letter (a-z), that has not already been guessed.'
    end
    @used_set.push(letter.downcase)
    if @contain_set.include?(letter.downcase)
      @contain_set.delete(letter.downcase)
    else
      @wrong_set.push(letter.downcase)
      @lives -= 1
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

  def save_game
    File.open('save.yaml', 'w') do |file|
      file.write(YAML.dump(self))
    end
    puts 'Game saved. Exiting program...'
    exit
  end

  def self.load_game
    save = File.open('save.yaml', 'r')
    YAML.unsafe_load(save)
  end
end
