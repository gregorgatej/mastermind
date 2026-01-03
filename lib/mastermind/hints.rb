class Hints
  attr_reader :array

  def initialize
    @array = []
  end

  def to_s
    SecretCode.colorize_entries(@array).join(" ")
  end

  def secret_code_equaled?
    @array == ["Black", "Black", "Black", "Black"]
  end

  def add_exact_match
    @array << "Black"
  end

  def add_correct_value_in_wrong_position
    @array << "White"
  end
end
