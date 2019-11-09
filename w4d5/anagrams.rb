def first_anagram?(str1, str2)
  chars = str1.split("")
  char_perms = chars.permutation.to_a
  word_perms = char_perms.map(&:join)
  word_perms.include?(str2)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def dumb_anagram?(str1, str2)
  str1.each_char do |char|
    idx = str2.index(char)
    return false unless idx
    str2[idx] = ""
  end
  return true if str2.length == 0
  false
end

# p dumb_anagram?("elvis", "lives")
# p dumb_anagram?("gizmo", "sally")

def smarter_anagram?(str1, str2)
  chars1 = str1.chars.sort
  chars2 = str2.chars.sort
  chars1 == chars2
end

# p smarter_anagram?("elvis", "lives")
# p smarter_anagram?("gizmo", "sally")

def genius_anagram?(str1, str2)
  return false if str1.length != str2.length
  cnt = Hash.new(0)
  (0...str1.length).each do |i|
    cnt[str1[i]] += 1
    cnt[str2[i]] -= 1
  end
  cnt.values.all?(0)
end

p genius_anagram?("elvis", "lives")
p genius_anagram?("gizmo", "sally")
