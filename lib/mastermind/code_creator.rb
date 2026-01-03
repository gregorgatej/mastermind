class CodeCreator
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def create_code
    code = @player.provide_code
    validate_and_convert(code)
  end

  private
  
  def validate_and_convert(input)
    input_string = input.is_a?(Array) ? input.join("") : input
    unless input_string.match?(/^[1-6]{4}$/)
      raise ArgumentError "Your input must be exactly 4 digits long, with each number being in " \
                          "the range between 1 and 6!"
    end
    input_array = input_string.split("").map(&:to_i)
    input_array
  end
end
