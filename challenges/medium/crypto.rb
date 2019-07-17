require "pry"
class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    text.downcase.gsub(/\W/, '')
  end
  
  def size
    root = Math.sqrt(normalize_plaintext.length)
    root.to_i.to_f == root ? root : root.to_i + 1
  end
  
  def plaintext_segments
    splitter = self.size
    segments = Array.new
    normalized = self.normalize_plaintext
    (splitter).times do |x|
      add = normalized[x*splitter, splitter]
      segments << add unless !!!add || add == ""
    end
    binding.pry
    segments
  end

  def ciphertext
    textual = self.plaintext_segments
    chars = Array.new
    self.size.times do |i|
      (self.size - 1).times do |j|
        chars << textual[j][i]
      end
    end
    chars.join
  end

  def normalize_ciphertext
    cipher = self.ciphertext
    (self.size - 1).times do |x|
      cipher.insert(self.size-1+self.size*x, " ")
    end
    cipher.rstrip
  end

  private
  attr_accessor :text
end