class Game
  def initialize
    @secret_code = SecretCode.new.code
  end

  def evaluate_guess(guess_array)
    hints = Hints.new
    exact_matches = []

    guess_array.each_with_index do |digit, index|
      if @secret_code[index] == digit
        hints.add_exact_match
        exact_matches << index
      end
    end

    guess_array.each_with_index do |digit, index|
      next if exact_matches.include?(index)
      if @secret_code.include?(digit)
        hints.add_correct_value_in_wrong_position
      end
    end

    hints
  end

  def start
    round = 1
    puts "Psst! The secret code is #{@secret_code.join(" ")}"
    while round <= 12
      puts "Input your four digit guess:"
      guess = gets.chomp
      guess_array = guess.split("").map(&:to_i)
      unless guess_array.length == 4 && guess.match?(/^[1-6]{4}$/)
        puts "Guess must be exactly 4 digits long, with each number being in the range between 1 and 6!"
        next
      end     
      hints = evaluate_guess(guess_array)
      puts hints
      if hints.secret_code_equaled?
        puts "You have won!"
        return
      end
      round += 1
    end
    puts "You don't have any more turns left to make a guess, game ends."
  end
end
