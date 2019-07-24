class BoardCase

  attr_reader :content
  def initialize(position)
    # Ici on initialise une case du plateau
    @position = position
    @content = " "
  end

  def change_content(value)
    @content = value
  end
end
