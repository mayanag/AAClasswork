class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
       if count == num_buckets
      unless self.include?(key) 
        resize!
        self[key] << key  
        self.count += 1
      end
    else
      unless self.include?(key) 
        self[key] << key  
        self.count += 1
      end
    end
  end

  def include?(key)
     self[key].include?(key)
  end

  def remove(key)
      if self.include?(key)
      self[key].delete(key)
      self.count -= 1
    end
  end

  private

  def [](num)
     @store[num.hash % num_buckets]
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
