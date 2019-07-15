class SecretHandshake
  SHAKES = ["wink", "double blink", "close your eyes", "jump"]
  BASE = 2
  MAX_BITS = 5

  def initialize(num)
    if num.class == Integer
      @input = to_binary(num)
    elsif num.class == String
      num.chars.all? { |x| ["0", "1"].include?(x) } ? @input = to_binary(num.to_i) : @input = "0"
    else
      puts "ERROR INITIALIZING"
    end
  end

  def commands
    command = Array.new
    j = 0
    (MAX_BITS-1).downto(1) do |i|
      command << SHAKES[j] if input.chars[i] == "1"
      j += 1
    end
    command.reverse! if input.chars[0] == "1"
    command
  end

  def to_binary(num)
    power = MAX_BITS
    output = Array.new(MAX_BITS, "0")
    loop do
      if num >= (BASE ** power)
        output[power] = "1"
        num -= BASE ** power
      end
      power -= 1
      break if power < 0
    end
    output.reverse.join
  end

  private
  attr_accessor :input
end