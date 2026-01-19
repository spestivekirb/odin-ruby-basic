class Board
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

  def check_solve(result)
    @solved = result[0] == 4
    result[0] == 4
  end

  def display(guess, result)
    print "#{guess}#{result}\n"
  end
end
