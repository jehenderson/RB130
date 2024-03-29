class Device
  attr_reader :recordings
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
 
  def listen
    record(yield) if block_given?
  end

  def play
    recordings.each { |record| puts record }
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"