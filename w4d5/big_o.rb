def my_min_v1(arr)
  (0...arr.length - 1).each do |i|
    min_value = true
    (0...arr.length).each do |j|
      next if i == j
      min_value = false if arr[j] < arr[i]
    end
  return arr[i] if min_value
  end
end

def my_min_v2(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el < min
  end
  min
end

# p my_min_v2([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def contiguous_sum_v1(arr)
  res = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      res << arr[i..j]
    end
  end
  res.map {|sub| sub.sum}.max
end
# list = [-5, -1, -3]


# p contiguous_sum_v1(list) # => 8

def contiguous_sum_v2(arr)
  # max = arr.max
  # return max if max < 0
  largest = arr[0]
  current = 0
  (0...arr.length).each do |i|
    current += arr[i]
    if current > largest
      largest = current
    end
    if current < 0
      current = 0
    end
  end
  return largest
end
list = [-5, -1, -3]
p contiguous_sum_v2(list) # => 8 (from [7, -6, 7])