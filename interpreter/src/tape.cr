# Brainf*ck Interpreter
# Tape Class

class Tape
  def initialize
    @tape = [0]
    @pos = 0
  end

  def tape
    @tape
  end

  def get
    @tape[@pos]
  end

  def pos
    @pos
  end

  def increase(positions = 1)
    @tape[@pos] = (@tape[pos] + positions) % 256
  end

  def decrease(positions = 1)
    @tape[@pos] = (@tape[pos] - positions) % 256
  end

  def forward(positions = 1)
    @pos += positions
    while @pos >= @tape.size
      @tape << 0
    end
  end

  def backward(positions = 1)
    @pos -= positions
    raise "Tape position should be > 0" if @pos < 0
  end
end
