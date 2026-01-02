class Game
  def initialize
    @secret_code = SecretCode.new.code
  end

  def evaluate_guess(guess)
    hints = Hints.new
    exact_matches = []
    guess_array = guess.split("").map(&:to_i)
    raise ArgumentError, "Guess must be exactly 4 digits long" unless guess_array.length == 4
    raise ArgumentError, "All parts of guess must be numbers between 1 and 6" unless guess.match?(/^[1-6]{4}$/)

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
    # game_won = false
    round = 1
    puts "Psst! The secret code is #{@secret_code.join(" ")}"
    while round <= 12
      puts "Input your four digit guess:"
      guess = gets.chomp
      hints = evaluate_guess(guess)
      puts hints
      round += 1
    end
  end
end
#       guess = gets.chomp.slice("")
#       if (guess.equals(secret_code))
#           game_won = true
#         break
#       else hints = evaluate_guess(guess)
#       end
#     end
#     if game_won
#       puts "Congrats"
#     else
#       puts "Try again next time" 
#   end
# end
