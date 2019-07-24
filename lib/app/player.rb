class Player

  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @nb_win = 0
    @nb_lose = 0
    @nb_even = 0
  end

  def win
    @nb_win += 1
  end

  def lose
    @nb_lose += 1
  end

  def even
    @nb_even += 1
  end
end
