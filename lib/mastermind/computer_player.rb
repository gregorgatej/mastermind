class ComputerPlayer
  attr_reader :name
  attr_writer :previous_rounds

  def initialize(name)
    @name = name
    @previous_rounds = []
    @invalid_colors = []
  end

  def provide_code
    random_colors
  end

  def provide_guess
    if @previous_rounds.empty?
      random_colors
    else
      improve_guess
    end
  end

  private

  def random_colors
    SecretCode.color_choices.sample(4)
  end

  def improve_guess
    last_round = @previous_rounds.last
    guess = last_round.guess
    hints = last_round.hints

    new_invalid_colors = guess.uniq.select do |color|
      guess.count(color) > hints.array.length
    end

    @invalid_colors.concat(new_invalid_colors)
    valid_colors_pool = SecretCode.color_choices - @invalid_colors
    result = []

    while result.size < 4
      result << valid_colors_pool.sample
    end
    
    result
  end
end
