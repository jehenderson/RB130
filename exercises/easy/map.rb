# Write a method called map that behaves similarly for Arrays. 
# It should take an Array as an argument, and a block. 
# It should return a new Array that contains the return values produced by the 
# block for each element of the original Array.

# If the Array is empty, map should return an empty Array, regardless of how the 
# block is defined.

def map(arr, &block)
  new_arr = Array.new
  arr.each { |element| new_arr << block.call(element) }
  new_arr
end

puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
puts map([]) { |value| true } == []
puts map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
puts map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
puts map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]