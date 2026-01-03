class Hints
  def initialize
    @hints = []
  end

  def to_s
    @hints.join(" ")
  end

  def secret_code_equaled?
    @hints == ["Red", "Red", "Red", "Red"]
  end

  def add_exact_match
    @hints << "Red"
  end

  def add_correct_value_in_wrong_position
    @hints << "White"
  end
end
