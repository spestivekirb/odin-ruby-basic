class Board
  def initialize(solution)
    @solution = solution
    @turn = 1
  end

  def guess(guess)
    exact = 0
    near = 0
    count = @solution.tally
    (0..3).each do |i|
      next unless guess[i] == @solution[i]

      exact += 1
      count[guess[i]] -= 1
      guess[i] = nil
    end
    guess.each do |color|
      if count[color]&.positive?
        count[color] -= 1
        near += 1
      end
    end
    [exact, near]
  end

  def display
    puts @solution
  end
end
