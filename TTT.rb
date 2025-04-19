/
Author: James Zesiger
Date: 4-19-25
Description: Ruby code to create simple Tic Tac Toe game.
/

def displayGrid(g)
        /
        Function that displays the grid of the game.
        It takes a 2D array as input and prints the grid to the console.
        /
        puts " |0|1|2|"                 # uses puts to print the header row with column numbers, puts adds a new line after printing
        for i in 0..2                   # iterates through the rows of the grid, from 0 to 2 inclusive
                print i,"|"             # prints the row number at the beginning of each row, uses | to separate the row number from the grid values
            for j in 0..2               # iterates through the columns of the grid, from 0 to 2 inclusive
                print g[i][j], "|" 
            end                         # end keyword to close the inner loop     
            puts ""
        end                             # end keyword to close the outer loop
end                                     # end keyword to close the function

def AIPlayer(grid)            
        /
        Function that simulates the AI player in the game.
        It randomly selects a position on the grid to place an "O" and checks if the game has ended.
        /          
        while true                              # Loops until a valid move is made
                x = rand(3)                     # Generates a random row index between 0 and 2 for row selection
                y = rand(3)                     # Generates a random column index between 0 and 2 for column selection
                if grid[x][y] == " "            # Checks if the selected position is empty
                        grid[x][y] = "O"        # Places an "O" in the selected position
                        return checkEnd(grid)   # Calls the checkEnd function to see if the game has ended
                end                             # end keyword to close the if statement
        end                                     # end keyword to close the while loop
end                                             # end keyword to close the function

def checkEnd(grid)
        for i in 0..2
                if grid[i].all?("X")            # Checks if all elements in the row are "X"
                        print "Player wins!"    # Prints "Player wins!" if the player wins
                        displayGrid(grid)       # Displays the grid after the player wins
                        return true             # Returns true to indicate the game has ended
                elsif grid[i].all?("O")         # Checks if all elements in the row are "O"
                        print "AI wins!"        # Prints "AI wins!" if the AI wins
                        displayGrid(grid)       # Displays the grid after the AI wins
                        return true             # Returns true to indicate the game has ended
                end                             # end keyword to close the if statement       
        end                                     # end keyword to close the for loop
        for i in 0..2                           # Iterates through the columns of the grid
                if grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] && grid[0][i] != " " && grid[1][i] == "X"       # Checks if all elements in the column are "X"
                        print "Player wins!"
                        displayGrid(grid)
                        return true
                elsif grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] && grid[0][i] != " " && grid[1][i] == "O"    # Checks if all elements in the column are "O"
                        print "AI wins!"
                        displayGrid(grid)
                        return true
                end
        end
        if grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] != " " && grid[1][1] == "X"               # Checks if all elements in the diagonal are "X"
                print "Player wins!"
                displayGrid(grid)
                return true
        elsif grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] != " " && grid[1][1] == "O"            # Checks if all elements in the diagonal are "O"
                print "AI wins!"
                displayGrid(grid)
                return true
        elsif grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[0][2] != " " && grid[1][1] == "X"            # Checks if all elements in the other diagonal are "X"
                print "Player wins!"
                displayGrid(grid)
                return true
        elsif grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[0][2] != " " && grid[1][1] == "O"            # Checks if all elements in the other diagonal are "O"
                print "AI wins!"
                displayGrid(grid)
                return true
        elsif !grid.flatten.include?(" ")       # Checks if there are no empty spaces left in the grid
                print "It's a draw!"            # Prints "It's a draw!" if the game ends in a draw
                displayGrid(grid)
                return true
        else
                return false
        end
end

def input(grid)
        /
        Function that takes user input for the player's move.
        It checks if the input is valid and updates the grid accordingly.
        /
        print "Enter the row and column (0-2) to place your X: "        # Prompts the user to enter the row and column for their move
        input = gets.chomp                                              # Reads the user input and removes any trailing newline characters
        row = input.split(",")[0].to_i                                  # Splits the input string by comma and converts the first part to an integer for row selection
        col = input.split(",")[1].to_i                                  # Splits the input string by comma and converts the second part to an integer for column selection
        if grid[row][col] == " "                                        # Checks if the selected position is empty
                grid[row][col] = "X"                                    # Places an "X" in the selected position
                return checkEnd(grid)                                   # Calls the checkEnd function to see if the game has ended
        else                                                            # If the selected position is not empty, it prompts the user to try again
                puts "Invalid move! Try again."                         # Prints an error message if the move is invalid
                input(grid)                                             # Calls the input function again to allow the user to make another move
        end
end

def Game()
        /
        Function that runs the main game loop.
        /
        grid = [[" "," "," "],          # Initializes a 2D array representing the grid of the game
        [" "," "," "],
        [" "," "," "]]
        while true                      # Loops until the game ends
                displayGrid(grid)       # Calls the displayGrid function to show the current state of the grid
                if input(grid)          # Calls the input function to get the player's move and check if the game has ended
                        break           # If the game has ended, it breaks out of the loop
                end
                if AIPlayer(grid)       # Calls the AIPlayer function to get the AI's move and check if the game has ended
                        break
                end 
        end

end

Game() # Runs game 