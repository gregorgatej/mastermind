class SecretCode

  attr_reader :code

  def initialize
    @code = set_code
  end

  def to_s
    @code.join(" ")
  end

  private

  def set_code
    [1, 2, 3, 4, 5, 6].sample(4)
  end
end
