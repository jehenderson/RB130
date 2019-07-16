class Scrabble
  VALUES = {
    1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
    2 => ['d', 'g'],
    3 => ['b', 'c', 'm', 'p'],
    4 => ['f', 'h', 'v', 'w', 'y'],
    5 => ['k'],
    8 => ['j', 'x'],
    10 => ['q', 'z']
  }

  def initialize(word)
    word ? @word = word.to_s : @word = ""
  end

  def score
    points = word.chars.map do |char|
      value = 0
      VALUES.each { |k, v| value = k if v.include?(char.downcase) }
      value
    end
    points.empty? ? 0 : points.reduce(&:+)
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private
  attr_reader :word
end