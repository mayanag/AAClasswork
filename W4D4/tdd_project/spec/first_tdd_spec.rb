require 'rspec'
require 'first_tdd'


describe '#my_uniq' do
  let (:array) { [1, 2, 3, 2, 3, 5, 7] }

  it 'should return an array with no duplicate values' do 
    expect(array.my_uniq).to eq([1,2,3,5,7]) 
  end

  it 'should return a new array' do 
    expect(array.my_uniq).to_not be(array) 
  end
end

describe '#two_sum' do
  let (:array) { [4, 3, 0, -3, 1, 0, -4] } 
  it 'should return indices of two elements that sum to zero' do
    expect(array[0] + array[6]).to eq(0)
  end
  
  it 'should generate unique pairs' do
    expect(array.two_sum).to contain_exactly([0, 6], [1,3], [2, 5])
  end

  it 'should return pairs ordered dictionary-wise' do
    expect(array.two_sum).to eq([[0, 6], [1,3], [2, 5]])
  end
end

describe '#my_transpose' do
  let (:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it 'should not call Array#transpose' do
    expect(matrix).to_not receive(:transpose)
  end

  it 'should reflect array about the forward diagonal' do
    expect(matrix.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end



describe '#stock_picker' do
  let(:prices) { [100, 80, 300, 40, 50, 160, 380] }

  it 'should ensure the sell date comes after the buy date' do
    expect(stock_picker([90, 300, 60])).to eq([0, 1])
  end

  it 'should return the most profitable pair of days' do 
    expect(stock_picker(prices)).to eq([3, 6])
  end

end