require_relative 'piece.rb'
class Bishop < Piece
    include Slideable
    def initialize
        @symbol = :B
    end

    def move_dirs
       diagonal_dirs
    end


end