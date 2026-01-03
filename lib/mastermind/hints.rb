class Hints
  attr_reader :array

  def initialize
    @array = []
  end

  def to_s
    @array.join(" ")
  end

  def secret_code_equaled?
    @array == ["Red", "Red", "Red", "Red"]
  end

  def add_exact_match
    @array << "Red"
  end

  def add_correct_value_in_wrong_position
    @array << "White"
  end
end
