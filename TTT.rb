def displayGrid(g)
        puts " |0|1|2|"
        for i in 0..2
                print i,"|"
            for j in 0..2
                print g[i][j], "|"
            end
            puts ""
        end
end

def AIPlayer(grid)
        while true
                x = rand(3)
                y = rand(3)
                if grid[x][y] == " "
                        grid[x][y] = "O"
                        return checkEnd(grid)
                end
        end
end

def checkEnd(grid)
        for i in 0..2
                if grid[i].all?("X")
                        print "Player wins!"
                        displayGrid(grid)
                        return true
                elsif grid[i].all?("O")
                        print "AI wins!"
                        displayGrid(grid)
                        return true
                end
        end
        for i in 0..2
                if grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] && grid[0][i] != " " && grid[1][i] == "X"
                        print "Player wins!"
                        displayGrid(grid)
                        return true
                elsif grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] && grid[0][i] != " " && grid[1][i] == "O"
                        print "AI wins!"
                        displayGrid(grid)
                        return true
                end
        end
        if grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] != " " && grid[1][1] == "X"
                print "Player wins!"
                displayGrid(grid)
                return true
        elsif grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] != " " && grid[1][1] == "O"
                print "AI wins!"
                displayGrid(grid)
                return true
        elsif grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[0][2] != " " && grid[1][1] == "X"
                print "Player wins!"
                displayGrid(grid)
                return true
        elsif grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[0][2] != " " && grid[1][1] == "O"
                print "AI wins!"
                displayGrid(grid)
                return true
        elsif !grid.flatten.include?(" ")
                print "It's a draw!"
                displayGrid(grid)
                return true
        else
                return false
        end
end

def input(grid)
        print "Enter the row and column (0-2) to place your X: "
        input = gets.chomp
        row = input.split(",")[0].to_i
        col = input.split(",")[1].to_i
        if grid[row][col] == " "
                grid[row][col] = "X"
                return checkEnd(grid)
        else
                puts "Invalid move! Try again."
                input(grid)
        end
end

def Game()
        grid = [[" "," "," "],
        [" "," "," "],
        [" "," "," "]]
        while true
                displayGrid(grid)
                if input(grid)
                        break
                end
                if AIPlayer(grid)
                        break
                end 
        end

end

Game()