class Show
attr_reader :table_round
  def initialize(board)

    rows_round = [
      [board.cases[0].content, board.cases[1].content, board.cases[2].content],
      [board.cases[3].content, board.cases[4].content, board.cases[5].content],
      [board.cases[6].content, board.cases[7].content, board.cases[8].content] ]
    @table_round = Terminal::Table.new :rows => rows_round
  end

end

