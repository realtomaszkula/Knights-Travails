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
      @board.reverse.each_with_index do |row, i|
        print (i-8).abs
        row.each { |x| print "|#{x}" }
        print "|\n"
    end
    letters = ('A'..'H').to_a.join(" ")
    print "  #{letters}\n"
  end

  def knight_moves
    found = false
    @start = [2,3]
    @goal = [4,6]
    @board[@start[0]][@start[1]] = 's'
    @board[@goal[0]][@goal[1]] = 'f'
    @queue = []

    @current = Node.new()
    @current.value = @start

    loop do
      x, y = @current.value[0], @current.value[1]
      possible_routes(x,y)

        @routes.each do |route|
          new_node = Node.new([route[0], route[1]], @current)
          @current.child = new_node

            if @board[route[0]][route[1]] == "f"
              print_winning_route(new_node)
              found = true
              break
            end
          @queue << new_node
        end
        break if found
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

    @route.reverse!
    mid_steps = @route[1..-1]
    mid_steps.to_enum.with_index(1).each do |cords, i|
      @board[cords[0]][cords[1]] = i.to_s
    end

    puts "Winning route: #{@route}, in #{@route.size - 1} steps."
    draw_the_board
  end

end





game = KnightMoves.new
game.knight_moves






