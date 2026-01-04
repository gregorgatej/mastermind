class Game
  def initialize
    @rounds = []
    @round = 1
    @max_rounds = 12
  end

  def start
    puts "Welcome to the game of Mastermind!"
    mode = choose_mode
    color_choices = SecretCode.color_choices
    puts "There are #{color_choices.length} possible choices to choose from in this game:"
    puts "#{SecretCode.colorize_entries(color_choices).join(" ")}"
    case mode
    when 1
      play_human_creates_code_computer_guesses
    when 2
      play_computer_creates_code_human_guesses
    end
  end

  def choose_mode
    puts "Choose if you want to be the secret code creator (1) or guesser (2):"
    gets.chomp.to_i
  end

  def play_human_creates_code_computer_guesses
    code_creator = CodeCreator.new(HumanPlayer.new("Human"))
    code_guesser = CodeGuesser.new(ComputerPlayer.new("Computer"))
    secret_code = SecretCode.new(code_creator.create_code)

    play_rounds(code_creator, code_guesser, secret_code)
  end

  def play_computer_creates_code_human_guesses
    code_creator = CodeCreator.new(ComputerPlayer.new("Computer"))
    code_guesser = CodeGuesser.new(HumanPlayer.new("Human"))
    secret_code = SecretCode.new(code_creator.create_code)

    play_rounds(code_creator, code_guesser, secret_code)
  end

  def play_rounds(code_creator, code_guesser, secret_code)
    puts "#{code_creator.player.name} has determined the secret code."
    # Uncomment this to better understand the feedback from the game
    # puts "Psst! The secret code is #{SecretCode.colorize_entries(secret_code.code).join(" ")}"
    puts "#{code_guesser.player.name} will try to guess the code."
    while @round <= @max_rounds
      puts "Let's play round #{@round}/#{@max_rounds}"
      if code_guesser.player.is_a?(ComputerPlayer)
        code_guesser.player.previous_rounds = @rounds
      end
      guess = code_guesser.make_guess
      puts "The guess is #{SecretCode.colorize_entries(guess).join(" ")}"
      hints = evaluate_guess(guess, secret_code.code)
      if hints.secret_code_equaled?
        puts "Congratulations #{code_guesser.player.name}, you have won!"
        return
      end
      unless hints.array.empty?
        puts "The hints for this guess are:"
        puts hints
      else
        puts "No hints for this guess."
      end
      @rounds << Round.new(@round, guess, hints)
      @round += 1
      puts "Length of @rounds is #{@rounds.length}"
    end
    puts "Unfortunately for you #{code_guesser.player.name}, you don't have any more turns " \
         "left to make a guess, so you lose."
  end

  def evaluate_guess(guess_array, secret_code_array)
    hints = Hints.new
    exact_matches = []

    guess_array.each_with_index do |color, index|
      if secret_code_array[index] == color
        hints.add_exact_match
        exact_matches << index
      end
    end

    guess_array.each_with_index do |color, index|
      next if exact_matches.include?(index)
      if secret_code_array.include?(color)
        hints.add_correct_value_in_wrong_position
      end
    end

    hints
  end
end
