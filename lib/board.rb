class Board

    attr_reader :cells
    
    def initialize
        @cells = [
            [Cell.new, Cell.new, Cell.new],
            [Cell.new, Cell.new, Cell.new],
            [Cell.new, Cell.new, Cell.new]
        ]
    end

    def append_mark(mark, position)
        @cells[column(position)][row(position)].value = mark
    end

    private def column(position)
        column = -1

        if position < 3
            column = 0
        elsif position >= 3 && position < 6
            column = 1
        elsif position >= 6 && position < 9
            column = 2
        end

        column
    end

    private def row(position)
        position % 3
    end

    def empty?(position)
        @cells[column(position)][row(position)].empty?
    end

    def full?
        for row in @cells
            for cell in row
                if cell.empty?
                    return false
                end
            end
        end

        true
    end
end