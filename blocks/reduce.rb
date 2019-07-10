def reduce(arr, n = 0)
  counter = 0
  while counter < arr.size
    n = yield(n, arr[counter])
    counter += 1
  end
  n
end

array = [1, 2, 3, 4, 5]

puts "Test case 1: #{reduce(array) { |acc, num| acc + num }}"                   # => 15
puts "Test case 2: #{reduce(array, 10) { |acc, num| acc + num }}"               # => 25
puts "Test case 3: #{reduce(array) { |acc, num| acc + num if num.odd? }}"       # => NoMethodError: undefined method `+' for nil:NilClass