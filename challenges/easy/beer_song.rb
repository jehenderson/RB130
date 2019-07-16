class BeerSong
  def initialize
    @song = Hash.new
    (0..99).each { |line| @song[line] = nil }
    99.downto(3) do |num|
      @song[num] = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
    end
    @song[2] = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    @song[1] = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
    @song[0] = "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse(line)
    song[line]
  end

  def verses(first, last)
    lines = Array.new
    first.downto(last) { |line| lines << song[line] }
    lines.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private
  attr_reader :song
end