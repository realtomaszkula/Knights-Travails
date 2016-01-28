require_relative './node.rb'

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

    current = Node.new(@start)
    @queue = []


    loop do
    x, y = @start[0], @start[1]
    possible_routes(x,y)

        new_node = Node.new([a, b], current)
        current.child = new_node

        if @board[a][b] == "x"
          print_winning_route(new_node)
          break
        end

        @queue << new_node
      end

      @start = @queue.shift
      @route << @start
    end
    p @route
  end


  def possible_routes(x,y)

      @routes = []
      a = x +  2; b = y + -1; @routes << [a,b]  if a < 7 && b < 7
      a = x +  1; b = y +  2; @routes << [a,b]  if a < 7 && b < 7
      a = x +  2; b = y +  1; @routes << [a,b]  if a < 7 && b < 7
      a = x + -1; b = y + -2; @routes << [a,b]  if a < 7 && b < 7
      a = x + -2; b = y + -1; @routes << [a,b]  if a < 7 && b < 7
      a = x + -1; b = y +  2; @routes << [a,b]  if a < 7 && b < 7
      a = x + -2; b = y +  1; @routes << [a,b]  if a < 7 && b < 7
  end

  def print_winning_route(node)

  end



end





game = KnightMoves.new
game.draw_the_board
game.knight_moves
game.draw_the_board





