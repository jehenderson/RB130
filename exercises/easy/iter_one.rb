def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

puts one?([1, 3, 5, 6]) { |value| value.even? } == true    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? } == false    # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? } == false   # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true # -> true
puts one?([1, 3, 5, 7]) { |value| true } == false          # -> false
puts one?([1, 3, 5, 7]) { |value| false } == false         # -> false
puts one?([]) { |value| true } == false                    # -> false