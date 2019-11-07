require_relative 'piece.rb'
class King < Piece
    def initialize(color, piece_pos)
        @color = color
        @piece_pos = piece_pos
        @symbol = :K
    end

    def move_diffs
        [[1,1],[-1,1],[-1,-1],[1,-1],[1,0],[-1,0],[0,1],[0,-1]] 
    end
end
