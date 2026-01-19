class Board
  def initialize(solution)
    @solution = solution
    @turn = 1
  end

  def guess(guess)
    exact = 0
    near = 0
    count = @solution.tally
    (1..4).each do |i|
      next unless guess[i] == @solution[i]

      exact += 1
      count[guess[i]] -= 1
      guess[i] = nil
    end
    guess.each do |guess|
      if guess && count[guess].positive?
        count[guess] -= 1
        near += 1
      end
    end
    [exact, near]
  end
end
