class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def provide_code
    puts "Input your four digit secret code:"
    gets.chomp
  end

  def provide_guess
    puts "Input your four digit guess:"
    gets.chomp
  end
end
