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

  def play
    # On joue à l'infini

  end

  def ask_replay
    # Ici on demande à rejouer
    # Renvoie true si rejoue, false sinon

  end
end
