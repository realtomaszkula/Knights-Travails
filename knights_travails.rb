class KnightMoves
  attr_accessor :board

  def initialize
    @board = [
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " ")
        ]
  end

  def draw_the_board
      @board.each_with_index do |row, i|
        print (i-8).abs
        row.each { |x| print "|#{x}" }
        print "|\n"
    end
    letters = ('A'..'H').to_a.join(" ")
    print "  #{letters}\n"
  end

  def knight_moves
    x, y = 3, 3
    @board[x+1][y-2] = 'x'
    @board[x+2][y-1] = 'x'
    @board[x+1][y+2] = 'x'
    @board[x+2][y+1] = 'x'
    @board[x-1][y-2] = 'x'
    @board[x-2][y-1] = 'x'
    @board[x-1][y+2] = 'x'
    @board[x-2][y+1] = 'x'

  end

end



start = [3][3]
goal = [5][5]


game = KnightMoves.new
game.draw_the_board
game.knight_moves
game.draw_the_board





