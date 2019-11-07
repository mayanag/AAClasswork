require_relative "piece.rb"
class Knight < Piece
    include Steppable
   def initialize(color, piece_pos)
        @color = color
        @piece_pos = piece_pos
        @symbol = :N
        
    end

    def move_diffs
        [[1,2],[-1,2],[-1,-2],[1,-2],[2,1],[2,-1],[-2,1],[-2,-1]] 
    end


end