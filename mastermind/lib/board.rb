require 'colorize'

class Board
  attr_reader :solution

  def initialize(solution)
    @solution = solution
    @turn = 1
    @solved = false
  end

  def guess(guess)
    exact = 0
    near = 0
    count = @solution.tally
    working_guess = guess.dup
    (0..3).each do |i|
      next unless working_guess[i] == @solution[i]

      exact += 1
      count[working_guess[i]] -= 1
      working_guess[i] = nil
    end
    working_guess.each do |color|
      if count[color]&.positive?
        count[color] -= 1
        near += 1
      end
    end
    [exact, near]
  end

  def solved?(result)
    @solved = result[0] == 4
    result[0] == 4
  end

  def display(guess, result)
    print "#{guess.map do |num|
      color(num)
    end.join}. Exact: #{result[0].to_s.colorize(:green)}, Near: #{result[1].to_s.colorize(:yellow)}.\n"
  end

  private

  def color(number)
    colors = {
      '1' => :red,
      '2' => :blue,
      '3' => :yellow,
      '4' => :green,
      '5' => :cyan,
      '6' => :magenta
    }
    bg_color = colors[number]
    text_color = number == '3' ? :black : :white
    " #{number} ".colorize(color: text_color, background: bg_color)
  end
end
