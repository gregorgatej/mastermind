class ComputerPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def provide_code
    [1, 2, 3, 4, 5, 6].sample(4)
  end

  def provide_guess
    [1, 2, 3, 4, 5, 6].sample(4)
  end
end
