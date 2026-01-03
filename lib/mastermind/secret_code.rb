class SecretCode
  COLOR_CHOICES = ["Blue", "Magenta", "Yellow", "Green", "Cyan", "Red"]
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def self.color_choices
    COLOR_CHOICES
  end

  def self.colorize_entries(entries)
    entries.map { |entry| entry.colorize(entry.downcase.to_sym) }    
  end

  def to_s
    colorize_entries(@code).join(" ")
  end
end
