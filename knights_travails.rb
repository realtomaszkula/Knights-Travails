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
    @queue = []

    @current = Node.new()
    @current.value = @start

    loop do
      x, y = @current.value[0], @current.value[1]
      possible_routes(x,y)

        @routes.each do |route|
          new_node = Node.new([route[0], route[1]], @current)
          @current.child = new_node

            if @board[route[0]][route[1]] == "x"
              print_winning_route(new_node)
              break
            end
          @queue << new_node
        end
      @current = @queue.shift
    end

  end

  def possible_routes(x,y)
      @routes = []
      a = x +  2; b = y + -1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x +  1; b = y +  2; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x +  2; b = y +  1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -1; b = y + -2; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -2; b = y + -1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -1; b = y +  2; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -2; b = y +  1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
  end

  def print_winning_route(node)
    @route = []
    loop do
      @route << node.value
      break if node.parent == nil
      node = node.parent
    end

    puts "Winning route: #{@route}"
  end

end





game = KnightMoves.new
game.draw_the_board
game.knight_moves
game.draw_the_board





