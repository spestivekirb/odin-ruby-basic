class Computer
  def initialize(state)
    @state = state # 0 if creator, 1 if guesser
  end

  def create_code
    code = []
    4.times do
      code.push(rand(1..6))
    end
    code
  end
end
