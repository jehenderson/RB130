class Octal
  BASE = 8
  
  attr_reader :input
  
  def initialize(input)
    @input = input.chars
  end
  
  def to_decimal
    exponent = input.size
    return 0 if invalid_input?
    output = input.map do |digit|
      exponent -= 1
      (digit.to_i * BASE ** exponent)
    end
    output.reduce(:+)
  end
  
  def invalid_input?
    input.any?{ |digit| digit.to_i > 7 || 
                        digit.to_i.to_s != digit}
  end
end