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
    input_string = input.is_a?(Array) ? input.join(" ") : input
    color_choices = SecretCode.color_choices
    entries_array = input_string.split(/\s+/)
    unless entries_array.length == 4 && entries_array.all? { |entry| color_choices.include?(entry) }
      raise ArgumentError "Your input must be 4 entries long, with each entry space separated and being one " \
                          "of the colors #{SecretCode.color_choices.join(", ")}, spelled exactly!" \
    end
    entries_array
  end
end
