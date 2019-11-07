require_relative 'piece.rb'
class Queen < Piece
    include Slideable
    def initialize
        @symbol = :Q
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end