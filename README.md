<h1>Knight's Travails</h1>
Solution to http://www.theodinproject.com/ruby-programming/data-structures-and-algorithms

Knight_moves and possible_routes are the two main methods which solve the problem.
The rest is responsible for receiving the user input and printing the results.


1. build a starting node (parent = nil, children = nil, value = starting position)
2. set currrent position to starting node
3. find out possible moves for the current position (this excludes every move that would go outside of the board, here all 8 moves are valid)
4. iterate through each move:
    - making a new node out of every possible move, establishing parent-child relation with the current position
    - check if the value of newly created node matches the one we are looking for
    - add each new node to the queue
5. if no results are found take the node from the front of the queue and repeat the steps 2-4, setting the current position to the node from the front of the queue.

You will end up checking all of the one step moves first, then all of the two steps moves etc.

Once the correct board position is reached you will send the "winning" node to print_winning_route method. 
The method checks the family tree of the node by looking for the parent of each node until the nil is found. If you found the solution in 4 steps it will look like this:
winning node(END) -> parent -> parent -> parent -> parent -> nil (START)
The nil means you have reached the start of the search since only the starting node does not have a parent.
