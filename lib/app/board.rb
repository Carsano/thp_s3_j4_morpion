class Board

  attr_accessor :cases
  def initialize
    # Ici on initialise un plateau
    a1=BoardCase.new(1) 
    a2=BoardCase.new(2)
    a3=BoardCase.new(3) 
    b1=BoardCase.new(4) 
    b2=BoardCase.new(5) 
    b3=BoardCase.new(6) 
    c1=BoardCase.new(7) 
    c2=BoardCase.new(8) 
    c3=BoardCase.new(9)  
    @cases = {a1 => "", a2 => "",a3 => "", b1 => "",b2 => "", b3 => "",c1 => "", c2 => "",c3=> "" }
    @nb_coups_joues = 0
  end

  def change_value_case(bcase, value)
    @cases[bcase]=value
  end

  def verif_alignement_points
    # verif lignes
    if @cases.values[0] != "" and [@cases.values[0], @cases.values[1], @cases.values[2]] == [@cases.values[0], @cases.values[0], @cases.values[0]]
      return true
    elsif @cases.values[3] != "" and [@cases.values[3], @cases.values[4], @cases.values[5]] == [@cases.values[3], @cases.values[3], @cases.values[3]]
      return true
    elsif @cases.values[6] != "" and [@cases.values[6], @cases.values[7], @cases.values[8]] == [@cases.values[6], @cases.values[6], @cases.values[6]]
      return true
    else
     return false 
    end











    # if (@cases[a1]==@cases[a2] and @cases[a1] = @cases[a3] and @cases[a1] != "") or (@cases[b1]==@cases[b2] and @cases[b1] = @cases[b3] and @cases[b1] != "") and (@cases[c1]==@cases[c2] and @cases[c1] = @cases[c3] and @cases[c1] != "")
    #   return true
    #   # verif colonnes
    # elsif (@cases[a1]==@cases[b1] and @cases[a1] = @cases[c1] and @cases[a1] != "") or (@cases[a2]==@cases[b2] and @cases[a2] = @cases[c2] and @cases[a2] != "") and (@cases[a3]==@cases[b3] and @cases[a3] = @cases[c3] and @cases[a3] != "")
    #   return true
    #   # verif diago
    # elsif (@cases[a1]==@cases[b2] and @cases[a1] = @cases[c3] and @cases[a1] != "") or (@cases[a3]==@cases[b2] and @cases[a3] = @cases[c1] and @cases[a3] != "")
    #   return true
    # else
    #   return false
    # end
  end
end
