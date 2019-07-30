factorial = Enumerator.new do |y|
  a, b = 1, 0
  loop do
    y << a
    b += 1
    a *= b
  end
end

# External iteration
7.times { p factorial.next }
# factorial.rewind
# puts "REWIND"
# Internal iteration
factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end
