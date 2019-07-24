class Board

  def initialize
    # Ici on initialise un plateau
    @cases = {a1=BoardCase.new(1) => "", a2=BoardCase.new(2) => "",a3=BoardCase.new(3) => "", b1=BoardCase.new(4) => "",b2=BoardCase.new(5) => "", b3=BoardCase.new(6) => "",c1=BoardCase.new(7) => "", c2=BoardCase.new(8) => "",c=BoardCase.new(9) => "" }
    @nb_coups_joues = 0
  end

  def change_value_case(bcase, value)
    @case[bcase]=value
  end

  def verif_alignement_points
    # verif lignes
    if (@case[a1]==@case[a2] and @case[a1] = @case[a3] and @case[a1] != "") or (@case[b1]==@case[b2] and @case[b1] = @case[b3] and @case[b1] != "") and (@case[c1]==@case[c2] and @case[c1] = @case[c3] and @case[c1] != "")
      return true
    elsif (@case[a1]==@case[b1] and @case[a1] = @case[c1] and @case[a1] != "") or (@case[a2]==@case[b2] and @case[a2] = @case[c2] and @case[a2] != "") and (@case[a3]==@case[b3] and @case[a3] = @case[c3] and @case[a3] != "")
      return true
    elsif (@case[a1]==@case[b2] and @case[a1] = @case[c3] and @case[a1] != "") or (@case[a3]==@case[b2] and @case[a3] = @case[c1] and @case[a3] != "")
      return true
    else
      return false
    end
  end
end
