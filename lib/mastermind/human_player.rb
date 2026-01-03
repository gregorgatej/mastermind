class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def provide_code
    puts "Input your four color secret code:"
    gets.chomp
  end

  def provide_guess
    puts "Input your four color guess:"
    gets.chomp
  end
end
