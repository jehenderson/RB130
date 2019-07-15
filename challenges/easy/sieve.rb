class Sieve
  attr_accessor :nums, :num
  
  def initialize(num)
    @num = num
    @nums = Hash.new
    (2..num).to_a.each { |element| nums[element] = false }
  end

  
  def primes
    (2..num).each do |element|
      (element+1..num).each do |tester|
        nums[tester] = true if tester % element == 0
      end
    end

    prime_nums = nums.select{ |_, v| !v }
    prime_nums.keys
  end
end