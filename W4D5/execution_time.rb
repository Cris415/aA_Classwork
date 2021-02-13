


def my_min(list)
  
  # #phase I O(n^2)
  # smallest = list[0]

  # (1...list.length).each do |i|
  #   smallest = list[i] if smallest > list[i]
  #   (i + 1...list.length).each do |j|
  #     smallest = list[j] if smallest > list[j]
  #   end
  # end
  
  #phase II O(n)
  smallest = list[0]

  (1...list.length).each do |i|
    smallest = list[i] if list[i] < smallest
  end
  smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)


def largest_contiguous_subsum(list) # O(n^2)
  # arr = []

  # list.each.with_index do |n, i|
  #   list.each.with_index do |n2, j|
  #     arr << list[i..j] if i < j 
  #   end
  # end

  # max = 0

  # arr.each do |subarr|
  #   max = subarr.sum if subarr.sum > max
  # end
  # max
  curr_sum = list[0]
  lrgst_sum = list[0]
  # reset if the sum is less than 0 dont include current num
  (1...list.length).each do |i|
    curr_sum = 0 if curr_sum < 0
    curr_sum += list[i] 
    lrgst_sum = curr_sum if lrgst_sum < curr_sum
  end

  lrgst_sum
end


list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
list1 = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p largest_contiguous_subsum(list1) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum(list2) # => -1 (from [-1])