require "pry"
class Series
  attr_accessor :str
  
  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError if n > str.length
    arr = Array.new
    dig = String.new
    n.times { dig = dig + '\d' }
    str.length.times { |i| arr << str.match(dig, i) if !!str.match(dig, i)}
    arr = arr.map do |element| 
      element.to_a.map do |num|
        split_chars = num.chars
        split_chars.map { |char| char.to_i }
      end.flatten
    end
  end
end