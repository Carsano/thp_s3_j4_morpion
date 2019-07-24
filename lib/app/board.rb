class Board

  def initialize
    # Ici on initialise un plateau
    @cases = {a1=BoardCase.new(1) => "", a2=BoardCase.new(2) => "",a3=BoardCase.new(3) => "", b1=BoardCase.new(4) => "",b2=BoardCase.new(5) => "", b3=BoardCase.new(6) => "",c1=BoardCase.new(7) => "", c2=BoardCase.new(8) => "",c=BoardCase.new(9) => "" }
    @nb_coups_joues = 0
  end

  def change_value_case(bcase, value)
    @case[bcase]=value
  end
end
