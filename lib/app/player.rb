class Player

  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @nb_win = 0
    @nb_lose = 0
    @nb_even = 0
    @nb_plays = 0
  end

  def to_json
    {
      "First name" => @name,
      "Number of game played" => @nb_plays,
      "Wins" => @nb_win,
      "Loss" => @nb_lose,
      "Even" => @nb_even
    }.to_json
  end
  def win
    @nb_win += 1
    add_plays
  end

  def lose
    @nb_lose += 1
    add_plays
  end

  def even
    @nb_even += 1
    add_plays
  end

  def add_plays
    @nb_plays += 1
  end

  def show_states 
    {
      "First name" => @name,
      "Number of game played" => @nb_plays,
      "Wins" => @nb_win,
      "Loss" => @nb_lose,
      "Even" => @nb_even
    }
  end
end
