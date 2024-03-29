# Write a method that takes a sorted array of integers as an argument, 
# and returns an array that includes all of the missing integers (in order) 
# between the first and last elements of the argument.

def missing(arr)
  all_nums = (arr[0]..arr[-1]).to_a
  missing = all_nums.reject { |num| arr.include?(num) }
  missing
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []