class Application

  attr_reader :game, :all_players, :joueur1, :joueur2
  def initialize
    @prompt = TTY::Prompt.new
    @replay = true
    @retour_menu = true
    welcome
    choice_load
    @all_players = []
  end

  def welcome
    system "clear"
    t = Time.now
    puts ("#"*50).colorize(:blue)
    puts ("#" + "MORPION QUI DECHIRE".center(48) + "#").colorize(:blue)
    puts ("#" + " "*48 + "#").colorize(:blue)
    puts ("#" + "VERSION FINALE".center(48) + "#").colorize(:blue)
    puts ("#" + " "*48 + "#").colorize(:blue)
    puts ("#" + "#{t.httpdate}".center(48) + "#").colorize(:blue)
    puts ("#"*50).colorize(:blue)
    puts ""
    puts "Bienvenue dans ce jeu de morpion designé par votre serviteur Carsano".fit(50)
    puts "Que dit Wikipédia ? : "
    puts "Le morpion est un jeu de réflexion se pratiquant à deux joueurs au tour par tour et dont le but est de créer le premier un alignement sur une grille (3x3)".fit(50)
    @prompt.keypress("Appuie sur une touche pour continuer")
  end

  def choice_load
    @prompt.select("Voulez-vous charger votre dernière partie sauvegardée?", %w(Oui Non), cycle: true) == "Oui" ? load_saving : ask_name

  end

  def saving_players
    system "clear"
    if File.exist?("db/saves.json")
      json_file = File.open("db/saves.json","w")
    else
      json_file = File.new("db/saves.json","w")
    end
    @all_players.each do |player|
      json_file.puts player.to_json
      puts player
    end
    json_file.close
    puts "Stats sauvegardées"
  end

  def load_saving
    if File.exist?("db/saves.json")
      @all_players = []
      json_file = File.open("db/saves.json","r")
      i = 0
      json_file.readlines.each do |line|
        @all_players[i] = line
        i += 1
      end
      @joueur1 = @all_players[0]
      @joueur2 = @all_players[1]
      json_file.close
      recover_players
    else
      puts "Aucune sauvegarde n'existe"
      ask_name
    end
  end

  def delete_load
    system "clear"
    if File.exist?("db/saves.json")
      File.delete("db/saves.json")
      puts "Sauvegarde supprimée"
    else
      puts "Aucune sauvegarde à supprimer"
    end
  end

  def recover_players
    @joueur1 = JSON.parse(@joueur1)
    @joueur2 = JSON.parse(@joueur2)
    @joueur1 = Player.new(@joueur1.values[0], "x".colorize(:blue), @joueur1.values[1], @joueur1.values[2], @joueur1.values[3], @joueur1[4])
    @joueur2 = Player.new(@joueur2.values[0], "o".colorize(:yellow), @joueur2.values[1], @joueur2.values[2], @joueur2.values[3], @joueur2[4])
    system "clear"
  end

  def ask_name
    puts '-'*50
    print "Veuillez rentrer le nom du joueur1\n> "
    name1 = gets.chomp.colorize(:blue)
    @joueur1 = Player.new(name1,"x".colorize(:blue))
    print "Veuillez rentrer le nom du joueur2\n> "
    name2 = gets.chomp.colorize(:yellow)
    @joueur2 = Player.new(name2, "o".colorize(:yellow))
  end

  def play_app
    # On joue à l'infini
    @replay = true
    while @replay
      @retour_menu = true
      system "clear"
      play_game
      while @retour_menu 
        menu
      end
    end
    system "clear"
    puts "Ciao !"
  end

  def play_game
    # Ici on joue une partie entière
    @game = Game.new(@joueur1, @joueur2)
    @all_players = [@game.j1, @game.j2] 
    end_game = @game.verify_endgame
    show_table
    until end_game
      system "clear"
      show_table
      @game.place_value
      end_game = @game.verify_endgame 
    end
    system "clear"
    show_table
    end_of_the_game
  end

  def show_table
    show = Show.new(@game)
    puts show.show_board

  end

  def end_of_the_game
    if @game.board.aborted == true
      system 'clear'
      puts "Ciao !"
      exit
    elsif @game.board.nb_coups_joues == 9
      puts "Match nul"
      @game.j1.even
      @game.j2.even
    else
      @game.active_player.lose
      @game.change_active_player
      @game.active_player.win
      puts "   ".colorize(:yellow) + " #{@game.active_player.name} remporte la partie !"+ "     ".colorize(:yellow)
    end

  end

  def ask_replay
    @prompt.select("Voulez-vous rejouer?", %w(Oui Non), cycle: true) == "Oui" ? @replay = true : @replay = false
  end

  def shows_statistics
    show = Show.new(@game)
    puts show.show_stats_players
  end

  def menu
    choice = @prompt.select('MENU', ["Voir les stats", "Rejouer", "Sauvegarder les stats", "Supprimer la sauvegarde", "Quitter"], cycle: true)
    case choice
    when "Voir les stats" 
      system "clear"
      shows_statistics
      @prompt.keypress("Appuie sur une touche pour continuer")
      system "clear"
      @retour_menu = true
    when "Quitter"
      @replay = false
      @retour_menu = false
    when "Sauvegarder les stats"
      saving_players
      @retour_menu = true
    when "Supprimer la sauvegarde"
      delete_load
      @retour_menu = true
    else
      @retour_menu = false
    end
  end
end
