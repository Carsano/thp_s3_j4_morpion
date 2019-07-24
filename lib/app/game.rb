class Game

  def initialize
    # initialize une nouvelle partie
    @board = Board.new
    @cases_availables = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @prompt = TTY::Prompt.new
  end

  def verify_endgame
    # On va vérifier si 3 pions sont alignés
    if @board.verif_alignement_points or @board.nb_coups_joues >= 9
      true
    else
      false
    end
    # vérifie si le plateau est complet
  end

  def place_value
    choice = @prompt.select("Choose your destiny?", @cases_availables) 
  end

  def transform_choice(choice)
    case choice
    when ""
    end
  end
end
