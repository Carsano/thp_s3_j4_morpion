class Application

  def initialize
    ask_name
    @prompt = TTY::Prompt.new


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

  def play_game
    # On joue à l'infini
    replay = ask_replay
    while replay
      play_part
      replay = ask_replay
    end

  end

  def play_part
    # Ici on joue une partie entière
      game = Game.new
  end

  def ask_replay
    # Ici on demande à rejouer
    # Renvoie true si rejoue, false sinon
    @prompt.select("Voulez-vous rejouer?", %w(Oui Non), cycle: true) == "Oui" ? true : false

   # choice = @prompt.yes?("Voulez-vous rejouer?") do |q|
   #    q.positive 'Yup'
   #    q.negative 'Nope'
   #    q.default false
   #  end

  end
end
