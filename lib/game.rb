class Game

    WINNING_COMBINATIONS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6]]

    def initialize
        @board = Board.new
        @display = Display.new
        @players = [Player.new("Player 1", "x"), Player.new("Player 2", "o")]
    end

    def start
        winner = nil
        active_player_index = 0

        loop do
            @display.show(@board)
            
            active_player = @players[active_player_index]
            
            position = ask_to_move(active_player)
            @board.append_mark(active_player.mark, position)
            active_player.append_position(position)

            active_player_index = (active_player_index + 1) % @players.length
            winner = winner(active_player)

            break if winner || @board.full?
        end

        @display.show(@board)
        @display.winner(winner)
    end

    def ask_to_move(player)
        position = 0

        loop do
            position = @display.ask_to_move(player)
            break if position.match(/[1-9]/) && @board.empty?(position.to_i - 1)
        end

        position.to_i - 1
    end

    def winner(player)
        for winning_combination in WINNING_COMBINATIONS
            if (winning_combination - player.positions).empty?
                return player
            end
        end

        nil
    end

end