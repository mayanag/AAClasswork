class Array
  
  def my_uniq
    new_arr = []
    self.each { |el| new_arr << el if !new_arr.include?(el) }
    new_arr
  end

  def two_sum
    arr = []

    (0...self.length).each do |idx1|
      (0...self.length).each do |idx2|
        if idx2 > idx1 && self[idx1] + self[idx2] == 0
          arr << [idx1, idx2]
        end
      end
    end
    arr
  end

  def my_transpose
    arr = []

    (0...self.length).each do |idx1|
      subs = []
      (0...self.length).each do |idx2|
        subs << self[idx2][idx1]
      end
      arr << subs
    end
    arr
  end

end

def stock_picker(array)
  max = 0
  days = []

  array.each_with_index do |buy_price, idx|
    array.each_with_index do |sell_price, idx2|
      if idx2 > idx && (sell_price - buy_price) > max 
        max = sell_price - buy_price
        days = [idx, idx2]
      end
    end
  end
  days
end