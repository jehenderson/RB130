# Write a method called any? that behaves similarly to Enumerable#any? for Arrays. 
# It should take an Array as an argument, and a block. It should return true if 
# the block returns true for any of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block 
# returns true.

# If the Array is empty, any? should return false, regardless of how the block 
# is defined.

# Your method may not use any standard ruby method that is named all?, any?, 
# none?, or one?.

def any?(arr, &block)
  return false if arr.empty?
  arr.each { |item| return true if block.call(item) }
  false
end

puts any?([1, 3, 5, 6]) { |value| value.even? } == true
puts any?([1, 3, 5, 7]) { |value| value.even? } == false
puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts any?([1, 3, 5, 7]) { |value| true } == true
puts any?([1, 3, 5, 7]) { |value| false } == false
puts any?([]) { |value| true } == false