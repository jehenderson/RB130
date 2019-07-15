class TextAnalyzer
  def process(&block)
    file_data = File.read("text.txt")
    block.call(file_data)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs"} # "3 paragraphs"
analyzer.process { |file| puts "#{file.split("\n").count} lines"} # "15 lines"
puts analyzer.process { |file| "#{file.split(" ").count} words"} # "126 words"