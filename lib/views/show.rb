class Show
attr_reader :table_morp
  def initialize(board)

    rows_morp = [
      [board.cases[0].content, board.cases[1].content, board.cases[2].content],
      [board.cases[3].content, board.cases[4].content, board.cases[5].content],
      [board.cases[6].content, board.cases[7].content, board.cases[8].content] ]
    @table_morp = Terminal::Table.new :heading => [1,2,3],:rows => rows_morp
    row
  end

end

