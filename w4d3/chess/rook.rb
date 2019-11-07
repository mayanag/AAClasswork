require_relative 'piece.rb'
class Rook < Piece
    include Slideable
    def initialize
        @symbol = :R
    end

    def move_dirs
        horizontal_dirs
    end


end