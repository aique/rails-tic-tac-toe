class Display

    def show(board)
        system "clear"

        board.cells.each do |row|
            print "+---++---++---+\n"

            row.each do |cell|
                print "| #{cell.value} |"
            end

            print "\n"
        end

        print "+---++---++---+\n\n"
    end

    def ask_to_move(player)
        puts "Please #{player.name}, insert a valid position"
        gets.chomp
    end

    def winner(player)
        if player
            puts "#{player.name} wins! \n\n"
        else
            puts "Draw!"
        end
    end
end