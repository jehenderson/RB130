def select(arr)
  counter = 0
  new_arr = Array.new
  while counter < arr.size
    new_arr.push(arr[counter]) if yield(arr[counter])
    counter += 1
  end
  new_arr
end

array = [1, 2, 3, 4, 5]

puts "test case 1"
select(array) { |num| num.odd? }      # => [1, 3, 5]
puts "test case 2"
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
puts "test case 3"
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true