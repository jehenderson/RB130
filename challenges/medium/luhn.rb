# Model the problem
  # Check that a number is valid according to the Luhn algorithm
  ## Luhn algorithm: Count from right digit, move left, double
  ## value of every second digit, subtract 9 if > 10
    # If the checksum ends in 0 the number is valid
    # Return the value of the checksum
  # If the number is not valid, add a check digit to make it valid
# Evaluate test cases -> Test file
# Datastructures
  # Take num, convert to s and break into its chars (digits) and convert each back to int
    # This will be an array of digits
# Algorithm
  # valid ? checksum : addends
    # checksum:
    # Loop through digits array from max index to 0 index (right to left)
    # Map values: At even indexes, double value, if > 10 subtract 9 
    # addends:
    # Sum all digits, add a final digit to sum such that
    # sum + new_num % 10 == 0
class Luhn
  attr_accessor :digits
  def initialize(num)
    @digits = num.to_s.chars.map(&:to_i)
  end
  
  def addends
    conversion = digits.reverse.map.with_index do |digit, index|
      if index.odd?
        digit *= 2
        digit -= 9 if digit > 10 
      end
      digit
    end
    conversion.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    luhn = Luhn.new(num)
    luhn.digits << nil
    (0..9).each do |option|
      luhn.digits[-1] = option
      break if luhn.valid?
    end
    luhn.digits.map(&:to_s).join.to_i
  end
end