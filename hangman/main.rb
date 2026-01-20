require_relative 'lib/game'

loop do
  puts 'Would you like to play a game of Hangman? (Yes/No)'
  response = gets.chomp
  if response.downcase == 'yes'
    if File.exist?('save.yaml')
      puts 'You have a saved game. Would you like to resume it? (Yes/No)'
      response = gets.chomp
      game = if response.downcase == 'yes'
               Game.load_game
             else
               Game.new
             end
    else
      game = Game.new
    end
    game.play_game

  elsif response.downcase == 'no'
    break
  else
    puts 'Invalid input. Please try again.'
  end
end
