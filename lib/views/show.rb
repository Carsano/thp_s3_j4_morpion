class Show
  attr_reader :table_morp
  def initialize(board)
    @board = board
    # rows_morp = [
    #   ["A", board.cases[0].content, board.cases[1].content, board.cases[2].content],
    #   ["B", board.cases[3].content, board.cases[4].content, board.cases[5].content],
    #   ["C", board.cases[6].content, board.cases[7].content, board.cases[8].content] ]
    # @table_morp = Terminal::Table.new :headings => ['','1','2','3'],:rows => rows_morp
  end

  def show_board
    rows_morp = [
      ["A", @board.cases[0].content, @board.cases[1].content, @board.cases[2].content],
      ["B", @board.cases[3].content, @board.cases[4].content, @board.cases[5].content],
      ["C", @board.cases[6].content, @board.cases[7].content, @board.cases[8].content] ]
    @table_morp = Terminal::Table.new :headings => ['','1','2','3'],:rows => rows_morp


  end

end

