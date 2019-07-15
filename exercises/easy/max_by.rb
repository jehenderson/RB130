# Write a method called max_by that behaves similarly for Arrays. 
# It should take an Array and a block, and return the element that contains the 
# largest value.

# If the Array is empty, max_by should return nil.
def max_by(arr, &block)
  values = arr.map { |element| block.call(element) }
  max = values[0]
  values.each { |value| max = value if value > max }
  max ? arr[values.find_index(max)] : max
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil