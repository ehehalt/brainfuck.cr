# Brainf*ck Interpreter

require "../src/brainfuck"
require "../src/code"
require "../src/tape"

class Interpreter
  include Brainfuck

  property code
  property tape

  def initialize(code)
    @code = Code.new(code)
    @tape = Tape.new
  end

  def run
    while @code.active
      bytecode = @code.get_bytecode
      case bytecode.code
      when '['
        if @tape.get == 0
          @code.pos = bytecode.loop_end
        end
      when ']'
        if @tape.get != 0
          @code.pos = bytecode.loop_begin
        end
        # return @tape.get != 0
      when '>'; @tape.forward(bytecode.count)
      when '<'; @tape.backward(bytecode.count)
      when '+'; @tape.increase(bytecode.count)
      when '-'; @tape.decrease(bytecode.count)
      when '.'; print @tape.get.chr
        # when ','; # get character
      end

      @code.forward
    end
    puts ""
  end
end
