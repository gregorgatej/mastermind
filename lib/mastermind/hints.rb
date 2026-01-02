class Hints
  
  def initialize
    @hints = []
  end

  def to_s
    @hints.join(" ")
  end

  def add_exact_match
    @hints << "x"
  end

  def add_correct_value_in_wrong_position
    @hints << "o"
  end
end
