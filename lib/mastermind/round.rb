class Round
  attr_reader :number, :guess, :hints
  
  def initialize(number, guess, hints)
    @number = number
    @guess = guess
    @hints = hints
  end
end
