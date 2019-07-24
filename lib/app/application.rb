class Application

  attr_accessor :game
  def initialize
    ask_name
    @prompt = TTY::Prompt.new
    play_part


  end

  def ask_name
    puts 'Veuillez rentrer le nom du joueur1'
    name1 = gets.chomp
    @joueur1 = Player.new(name1,"x")
    puts 'Veuillez rentrer le nom du joueur2'
    name2 = gets.chomp
    @joueur2 = Player.new(name2, "o")
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
      @game = Game.new(@joueur1, @joueur2)
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
