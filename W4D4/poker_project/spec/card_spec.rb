require 'card'
require 'rspec'



describe Card do 
  subject(:queen_hearts) {Card.new(:Q, :♥️)}
  describe '#initialize' do
    it 'takes a suit and a face and creates a new card instance' do
      expect { Card.new("Q", "triangle") }
    end
    end



    it 'assigns a face and suit successfully' do
      expect(queen_hearts.face).to eq(:queen)
      expect(queen_hearts.suit).to eq(:heart)
    end


  end



end

