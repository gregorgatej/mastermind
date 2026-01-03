class CodeGuesser
  def initialize(player)
    @player = player
  end

  def guess_code
    guess = @player.provide_guess
    validate_and_convert(guess)
  end

  private
  
  def validate_and_convert(input)
    input_string = input.join("")
    unless input_string.match?(/^[1-6]{4}$/)
      raise ArgumentError "Your input must be exactly 4 digits long, with each number being in" \
                          "the range between 1 and 6!"
    end
    input_array = input_string.split("").map(&:to_i)
    input_array
  end
end
