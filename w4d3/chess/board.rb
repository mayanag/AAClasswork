require_relative 'piece.rb'
require_re
class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @grid.each_with_index do |row, idx|
            if idx == 0 || idx == 1 || idx == 6 || idx == 7
                row.length.times do |jdx|
                    @grid[idx][jdx] = Piece.new("white", [idx, jdx], self)
                end
            end
        end
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @grid[x][y] = value
    end



    def move_piece(start_pos, end_pos)
        # xi, yi = start_pos #initial x and y positions
        # xf, yf = end_pos #end x, y positions
        raise "invalid position" if (start_pos.first || start_pos.last ) < 0 || (start_pos.first || start_pos.last ) > 7
        raise "invalid position" if (end_pos.first || end_pos.last ) < 0 || (end_pos.first || end_pos.last ) > 7
        raise "occupied final position" if self[end_pos] != nil#if @grid[xf][yf] != nil
        raise "no piece at start posiiton" if self[start_pos] == nil#if  @grid[xi][yi] == nil
        peace = self[start_pos]
        self[end_pos] = peace
        self[start_pos] = nil
    end
end