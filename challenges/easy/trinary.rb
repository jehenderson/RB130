class Trinary
  BASE = 3

  def initialize(num_str)
    @trinaries = num_str.chars
  end

  def to_decimal
    output = Array.new

    return 0 unless trinaries.all? do |tri|
      (0..2).cover?(tri.to_i) && tri.to_i.to_s == tri
    end

    trinaries.reverse.each.with_index do |tri, index|
      output << tri.to_i * BASE**index
    end
    output.reduce(&:+)
  end

  private

  attr_reader :trinaries
end
