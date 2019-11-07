require_relative 'board.rb'
class Piece
    attr_accessor :moves, :piece_pos
    attr_reader :color, :board
    def initialize(color, piece_pos, board)
        @board = board
        @color = color
        @piece_pos = piece_pos
        board(piece_pos) = self
    end
end

module Slideable
    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def move_dirs
    end

    def moves
        all_moves = []
        move_dirs.each do |dir|
            all_moves += grow_unblocked_moves(dir)
        end
        all_moves
    end

    def on_board?(pos)
        x, y = pos
        return true if (x < 0 && x < 8) && (y < 0 && y < 8)
        false        
    end

    def grow_unblocked_moves(dir)
        current_pos = self.piece_pos
        moves_in_dir = []
        while board[next_pos] == nil || self.color != board[next_pos].color && on_board?(next_pos) 
            next_pos = current_pos + dir
            moves_in_dir << next_pos
            current_pos = next_pos 
        end
        moves_in_dir
    end
end

module Steppable
    def moves
        current_pos = self.piece_pos
        move_diffs.select do |mvmt|
            next_pos = curernt_pos + mvmt
            board[next_pos] == nil || self.color != board[next_pos].color && on_board?(next_pos)
        end
    end

    def move_diffs
    end

end






