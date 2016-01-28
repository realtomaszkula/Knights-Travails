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
    @start = [4,3]
    @goal = [2,2]

    @board[4][3] = 'o'
    @board[2][2] = 'x'

    @queue = []
    @route = []

    @route << @start

    loop do
    x, y = @start[0], @start[1]

      a = x + 2; b = y + -1
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      a = x + 1; b = y +  2
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      a = x + 2; b = y +  1
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      a = x + -1; b = y + -2
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      a = x + -2; b = y + -1
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      a = x + -1; b = y +  2
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      a = x + -2; b = y +  1
      if a < 7 && b < 7
        if @board[a][b] == "x"
          found = true
          @route << [a,b]
          break
        end
        @queue << [a,b]
      end

      @start = @queue.shift
    end
    # @route << @goal
    p @route
  end



end





game = KnightMoves.new
game.draw_the_board
game.knight_moves
game.draw_the_board





