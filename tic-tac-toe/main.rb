require_relative 'lib/game'
loop do
  puts 'Would you like to play a game of Tic Tac Toe? (Yes/No)'
  response = gets.chomp
  if response.downcase == 'yes'
    game = Game.new
    puts game.play_game
  elsif response.downcase == 'no'
    break
  else
    puts 'Invalid input. Please try again.'
  end
end
