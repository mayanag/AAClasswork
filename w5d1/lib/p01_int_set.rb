class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.size || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private
  
  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
    num
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count == num_buckets
      unless self.include?(num) 
        resize!
        self[num] << num  
        self.count += 1
      end
    else
      unless self.include?(num) 
        self[num] << num  
        self.count += 1
      end
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    elements = @store.dup.flatten
    @store = Array.new(num_buckets*2) { Array.new }
    @count = 0
    elements.each { |ele| self.insert(ele) }
  end
end
