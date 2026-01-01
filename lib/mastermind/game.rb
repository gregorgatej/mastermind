class Game
  def initialize
    @secret_code = secret_code
  end

  def secret_code
    [1, 2, 3, 4, 5, 6].sample(4)
  end

  def evaluate_guess(guess)
    hints = []
    # TODO for every entry where both guess.value && guess.index are equal to secret_code add an "x" to hints
    #      for every entry where only guess.value that is equal add an "o" to hints
    hints
  end

  def start
    # game_won = false
    round = 1
    while round <= 12
      puts "Input your four digit guess:"
      guess = gets.chomp
      puts guess
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
