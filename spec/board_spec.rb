require 'board'
require 'cell'

describe Board do

    context "given an empty board" do
        it "should not be full" do
            board = Board.new
            expect(board.full?).to eq(false)
        end
    end
end