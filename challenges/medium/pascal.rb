class Triangle
  attr_reader :rows

  def initialize(size)
    tri = Hash.new
    1.upto(size) { |x| tri[x] = Array.new(x) }
    tri.each do |k, v|
      tri[k][0] = 1
      tri[k][-1] = 1
      v.map!.with_index do |cell, index|
        cell = [tri[k-1][index-1], tri[k-1][index]].reduce(&:+) unless !!cell
        cell
      end
    end
    @rows = tri.values
  end

  private
  attr_writer :rows
end