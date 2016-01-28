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

  def play

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
    @start = [4,3]
    @goal = [2,2]
    @board[2][2] = 'x'

    queue = []
    step_seq = []

      # found if @board[x][y] == 'x'
      # queue << [x, y]

  end

  def possible_moves
    x, y = @start[0], @start[1]
    @moves = []

    x += 2; y -= -1
      moves << [x,y] if x < 7 && y < 7
    x +=  1; y -=  2
      moves << [x,y] if x < 7 && y < 7
    x +=  2; y -=  1
      moves << [x,y] if x < 7 && y < 7
    x += -1; y -= -2
      moves << [x,y] if x < 7 && y < 7
    x += -2; y -= -1
      moves << [x,y] if x < 7 && y < 7
    x += -1; y -=  2
      moves << [x,y] if x < 7 && y < 7
    x += -2; y -=  1
      moves << [x,y] if x < 7 && y < 7
  end

end





game = KnightMoves.new
game.draw_the_board
game.knight_moves
game.draw_the_board





