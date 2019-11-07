require 'singleton.rb'
require_relative 'piece.rb'
class NullPiece < Piece
    include Singleton
    def initialize
    end
end