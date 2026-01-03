class ComputerPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def provide_code
    random_colors
  end

  def provide_guess
    random_colors
  end

  private

  def random_colors
    SecretCode.color_choices.sample(4)
  end
end
