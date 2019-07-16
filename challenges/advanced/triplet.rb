# A Pythagorean triplet is a set of three natural numbers, 
# {a, b, c}, for which, a**2 + b**2 = c**2.
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.
require "pry"
class Triplet
  attr_accessor :nums
  def initialize(*args)
    @nums = *args
  end

  def sum
    nums.reduce(&:+)
  end

  def product
    nums.reduce(&:*)
  end

  def pythagorean?
    nums[0]**2 + nums[1]**2 == nums[2]**2
  end

# Come back to this after later lessons. Test cases
# very unclear
  # def self.where(args)
  #   max = args[:max_factor] || 10
  #   min = args[:min_factor] || 1
  #   sum = args[:sum]
  #   binding.pry
  end
end