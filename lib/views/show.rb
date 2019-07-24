class Show
  attr_reader :table_morp
  def initialize(game)
    @game = game
    # rows_morp = [
    #   ["A", board.cases[0].content, board.cases[1].content, board.cases[2].content],
    #   ["B", board.cases[3].content, board.cases[4].content, board.cases[5].content],
    #   ["C", board.cases[6].content, board.cases[7].content, board.cases[8].content] ]
    # @table_morp = Terminal::Table.new :headings => ['','1','2','3'],:rows => rows_morp
  end

  def show_board
    rows_morp = [
      ["A", @game.board.cases[0].content, @game.board.cases[1].content, @game.board.cases[2].content],
      ["B", @game.board.cases[3].content, @game.board.cases[4].content, @game.board.cases[5].content],
      ["C", @game.board.cases[6].content, @game.board.cases[7].content, @game.board.cases[8].content] ]
    @table_morp = Terminal::Table.new :headings => ['','1','2','3'],:rows => rows_morp
  end

  def show_stats_players
    rows_stats = [
      ["Name","#{@game.j1.show_states.values[0]}", "#{@game.j2.show_states.values[0]}"],
      ["Nb played","#{@game.j1.show_states.values[1]}", "#{@game.j2.show_states.values[1]}"],
      ["Wins","#{@game.j1.show_states.values[2]}", "#{@game.j2.show_states.values[2]}"],
      ["Loss","#{@game.j1.show_states.values[3]}", "#{@game.j2.show_states.values[3]}"],
      ["Even","#{@game.j1.show_states.values[4]}", "#{@game.j2.show_states.values[4]}"]
    ]
    stats = Terminal::Table.new :title => "Stats", :headings => ['Parameters', "#{@game.j1.name}", "#{@game.j2.name}"], :rows => rows_stats
  end
end

