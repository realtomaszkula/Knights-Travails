<h1>Knight's Travails</h1>
Solution to http://www.theodinproject.com/ruby-programming/data-structures-and-algorithms

knight_moves and possible_routes are the two main methods which solve the problem
the rest is responsilbe for receiving the user input and printing the results


1. build a starting node (parent nil, children nil, value = starting position)
2. set currrent position to starting node
3. find out possible moves for the current position (this excludes every route that would go outside of the board, here all 8 moves are valid)
4. iterate thorough each route:
    - making a new node out of every possible move, establishing parent-child relation with the current position
    - check if the value of newly created node, matches the one we are looking for
    - add each new node to the queue
5. if no results are found take the node from the front of the queue and repeat the steps 2-4, setting the current position to the node from the front of the queue.

You will end up checking all the one step moves first, then all the two steps moves etc.


Once the correct board position is reached you send the "winning" node to print_winning_route method, which checks out the family tree of the node. If you found the solution in 4 steps it will look like this:
winning node(END) -> parent -> parent -> parent -> parent -> nil (START)

The nil means you reached the start of the search sice only the starting node does not have a parent.