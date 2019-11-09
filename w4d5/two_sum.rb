def bad_two_sum?(arr, target_sum)
    # your code here...
    (0...arr.length - 1).each do |i|
      (i+1...arr.length).each do |j|
        return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

def sorted_two_sum(arr, target_sum)
  arr.sort!
  arr.each do |ele|
    bsearch_target = target_sum - ele
    return true if bsearch(arr, bsearch_target)
  end
  false
end

def bsearch(arr, target)
  mid = arr.length / 2
  case arr[mid] <=> target
  when -1
    right = arr.drop(mid)
    return mid + bsearch(right, target)
  when 0
    return mid
  when 1
    left = arr.take(mid)
    return bsearch(left, target)
  end
  return nil
end
# [1,2,3]
arr = [0, 1, 5, 7]
p sorted_two_sum(arr, 6) # => should be true
p sorted_two_sum(arr, 10) # => should be false