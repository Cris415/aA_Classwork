

def bad_two_sum?(arr, target) #O(n^2)
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[j] + arr[i] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
arr2 = [-3, -1, 0, 3, 5, 7, 15]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target)

  i = 0
  j = arr.length - 1

  while i != j
    return true if arr[i] + arr[j] == target
    if arr[i] + arr[j] > target
      j -= 1
    else
      i += 1
    end
  end
  false
end

p okay_two_sum?(arr2, 6) # => should be true
p okay_two_sum?(arr2, 22) # => should be false


arr = [0, 1, 5, 7]
arr2 = [-3, -1, 0, 3, 5, 7, 15]
arr3 = [7, 15, 3, 0, 5, -3, -1]

# 1 + 5 = 6
# 7 + -1 = 6

# hash[target-val1] = nil