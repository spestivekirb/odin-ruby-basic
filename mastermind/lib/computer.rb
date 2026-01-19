class Computer
  def initialize(state)
    @state = state # 0 if creator, 1 if guesser
    @guess = Array.new(4, nil)
  end

  # Used if computer is guesser
  def set_answer(answer)
    @answer = answer
  end

  def create_code
    code = []
    4.times do
      code.push(rand(1..6).to_s)
    end
    code
  end

  def guess_code
    result = []
    @guess.each do |value|
      result.push(value || rand(1..6).to_s)
    end
    memorize(result)
    result
  end

  def memorize(result)
    result.each_with_index do |value, index|
      @guess[index] = value if value == @answer[index]
    end
  end
end
