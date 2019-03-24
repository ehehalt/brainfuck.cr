# Brainf*ck Code class

class Code
  property pos

  def initialize(@code : String)
    @pos = 0
  end

  def code
    @code
  end

  def active
    @pos < @code.size
  end

  def get
    if @pos < @code.size
      @code[@pos]
    else
      raise "Code::get: Tape position is #{@pos}, tape size is #{@code.size}"
    end
  end

  def forward
    @pos += 1
  end

  def backward
    @pos -= 1
    raise "Tape position should be > 0" if @pos < 0
  end
end
