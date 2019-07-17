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
    segments
  end

  def ciphertext
    cipher = Array.new
    rows = self.plaintext_segments
    rows.each_index do |i|
      rows.each.with_index do |row, j|
        cipher << row[i]
      end
    end
    cipher.join
  end

  def normalize_ciphertext
    rows = self.plaintext_segments
    cipher = Array.new
    self.size.times do |i|
      rows.each_index do |j|
        cipher << rows[j][i] if j < rows.size
      end
      cipher << " "
    end
    cipher.join.rstrip
  end

  private
  attr_accessor :text
end