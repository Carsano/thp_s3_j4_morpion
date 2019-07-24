class Game

  attr_accessor :board
  def initialize(j1,j2)
    # initialize une nouvelle partie
    @board = Board.new
    @cases_availables = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @prompt = TTY::Prompt.new
    @j1 = j1
    @j2 = j2
    @active_player = @j1
  end

  def verify_endgame
    # On va vérifier si 3 pions sont alignés
    if @board.verif_alignement_points or @board.nb_coups_joues == 9
      true
    else
      false
    end
    # vérifie si le plateau est complet
  end

  def place_value
    choice = @prompt.select("Placez votre pion", @cases_availables) 
    @cases_availables.delete(choice)
    @board.change_value_case(transform_choice(choice), @active_player.symbol)
    change_active_player
  end

  def transform_choice(choice)
    case choice
    when "A1" then return 0
    when "A2" then return 1
    when "A3" then return 2
    when "B1" then return 3
    when "B2" then return 4
    when "B3" then return 5
    when "C1" then return 6
    when "C2" then return 7
    when "C3" then return 8
    end
  end

  def change_active_player
    if @active_player == @j1
      @active_player = @j2
      else
        @active_player = @j1
    end
  end
end
