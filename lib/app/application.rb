class Application

  attr_reader :game
  def initialize
    ask_name
    @prompt = TTY::Prompt.new
    play_game


  end

  def ask_name
    puts 'Veuillez rentrer le nom du joueur1'
    name1 = gets.chomp
    @joueur1 = Player.new(name1,"x")
    puts 'Veuillez rentrer le nom du joueur2'
    name2 = gets.chomp
    @joueur2 = Player.new(name2, "o")
  end

  def play_app
    # On joue à l'infini
    replay = true
    while replay
      play_game
      replay = ask_replay
    end

  end

  def play_game
    # Ici on joue une partie entière
    @game = Game.new(@joueur1, @joueur2)
    end_game = @game.verify_endgame
    until end_game
      system "clear"
      show = Show.new(@game.board)
      puts show.table_round
      puts "#{@game.active_player.name} (#{@game.active_player.symbol}), à vous de jouer" 
      @game.place_value
      end_game = @game.verify_endgame 
    end
    end_of_the_game
  end

  def end_of_the_game
    if @game.board.nb_coups_joues == 9
      puts "Match nul"
      @game.j1.even
      @game.j2.even
    else
      @game.active_player.lose
      @game.change_active_player
      @game.active_player.win
      puts "#{@game.active_player.name} remporte la partie"

    end

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
