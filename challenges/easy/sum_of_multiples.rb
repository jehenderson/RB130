class SumOfMultiples
  DEFAULT = [3, 5]
  
  def initialize(*args)
    @factors = args.empty? ? DEFAULT : args
  end

  def to(num)
    multiples = (1..num-1).to_a.select do |x|
      factors.any? { |factor| x % factor == 0 }
    end
    multiples.empty? ? 0 :multiples.reduce(&:+)
  end

  def self.to(num)
    multiples = (1..num-1).to_a.select do |x|
      DEFAULT.any? { |factor| x % factor == 0 }
    end
    multiples.empty? ? 0 : multiples.reduce(&:+)
  end

  private
  attr_accessor :factors
end