def zip(arr1, arr2)
  new_arr = Array.new(arr1.size)
  arr1.each_index { |index| new_arr[index] = [arr1[index], arr2[index]] }
  new_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]