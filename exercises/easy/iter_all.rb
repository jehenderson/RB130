def all?(arr, &block)
  return true if arr.empty?
  return true if arr == arr.select { |item| block.call(item) }
  false
end

puts all?([1, 3, 5, 6]) { |value| value.odd? } == false
puts all?([1, 3, 5, 7]) { |value| value.odd? } == true
puts all?([2, 4, 6, 8]) { |value| value.even? } == true
puts all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts all?([1, 3, 5, 7]) { |value| true } == true
puts all?([1, 3, 5, 7]) { |value| false } == false
puts all?([]) { |value| false } == true