class Application

  def initialize
    ask_name

  end

  def ask_name
    puts 'Veuillez rentrer le nom du joueur1'
    @joueur1 = gets.chomp
    puts 'Veuillez rentrer le nom du joueur2'
    @joueur2 = gets.chomp
  end

  def new_board
    @board = Board.new
  end
end
