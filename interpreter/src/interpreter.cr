# Brainf*ck Interpreter

require "../src/code"
require "../src/tape"

class Interpreter
  property code
  property tape

  def initialize(code)
    @code = Code.new(code)
    @tape = Tape.new
  end

  def run
    runCode()
  end

  def runCode
    while @code.active
      case @code.get
      when '['
        if @tape.get == 0
          depth = 1
          while depth != 0
            @code.forward
            case @code.get
            when '['; depth += 1
            when ']'; depth -= 1
            end
          end
        end
      when ']'
        if @tape.get != 0
          depth = 1
          while depth != 0
            @code.backward
            case @code.get
            when ']'; depth += 1
            when '['; depth -= 1
            end
          end
        end
      when '>'; @tape.forward
      when '<'; @tape.backward
      when '+'; @tape.increase
      when '-'; @tape.decrease
      when '.'; print @tape.get.chr
        # when ','; # get character
      end

      @code.forward
    end
    puts ""
  end
end
