require 'pry-byebug'

require_relative "game.rb"
require_relative "cell.rb"
require_relative "board.rb"
require_relative "player.rb"
require_relative "display.rb"

class Main

    def play
        game = Game.new
        game.start
    end

end

if __FILE__ == $0
    loop do
        main = Main.new
        main.play

        play_again = ''

        loop do 
            puts "Do you want to play another game? [y/n]"
            play_again = gets.chomp
            break if play_again == 'y' || play_again == 'n'
        end
        break if play_again == 'n'
    end
end