class SecretCode
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def to_s
    @code.join(" ")
  end
end
