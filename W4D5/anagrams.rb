

# [1, 2, 3, 4]
# [1] [2, 3, 4]
# [1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1]
# [2] [1, 3, 4]
# [4] [1, 2, 3]
# [
# 
# 
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
# [1, 2, 8, 4, 5, 6, 7, 3, 9]
# 
# 

def word_perm(word)
  return word if word.length == 1
  perms = word_perm(word[0...-1])
  perms_array = []
  
  perms.each do |sub|
    sub.each_char.with_index do |char, i|
      if perms.length.odd? 
        perms[0], perms[-1] = perms[-1], perms[0]
      else
        perms[i], perms[-1] = perms[-1], perms[i]
      end
      perms_array << perms
    end
  end
  perms_array
end

def anagram?(word1, word2)
  word1.split("").permutation().to_a.include?(word2.split(""))
end

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true


def second_anagram?(word1, word2)
  word2_arr = word2.split("")

  word1.each_char do |char|
    index_2 = word2_arr.index(char)
    return false if index_2.nil?
    word2_arr.delete_at(index_2) if !word2_arr.nil?
  end 
  word2_arr.length == 0
end


# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

#arr[1]

def third_anagram?(word1, word2)
  word1.split("").sort == word2.split("").sort
end


def fourth_anagram?(word1, word2)
  # word1_hash = Hash.new(0)
  # # word2_hash = Hash.new(0)

  # word1.each_char {|char| word1_hash[char] += 1 }
  # word2.each_char {|char| word2_hash[char] += 1 }
  # word1_hash == word2_hash

  word_hash = Hash.new(0)
  word1.each_char {|char| word_hash[char] += 1 }
  word2.each_char {|char| word_hash[char] -= 1 }
  word_hash.values.all? {|val| val == 0}
end
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> tru