require "byebug"
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 96221 if self.empty?
    start = self.first
    (0...self.length).each do |i|
      start ^= self[i]
    end 
    start
  end
end

class String
  def hash
    alpha = ('A'..'z').to_a
    array = self.chars
    return 96221 if self.empty?
    start = alpha.index(array.first)
    (0...array.length).each do |i|
      start ^= alpha.index(array[i])
    end 
    start
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = []
    self.each do |k, v|
      array << k
      array << v
    end
    return 96221 if self.empty?

    alpha = ('A'..'z').to_a 
    start = 0

    (0...array.length).each do |i|
      if array[i].is_a?(String)
        start ^= alpha.index(array[i].to_s)
      elsif array[i].is_a?(Symbol)
        start ^= alpha.index(array[i].to_s) * 13
      else
        start ^= array[i]
      end
    end 
    start
  end
end
