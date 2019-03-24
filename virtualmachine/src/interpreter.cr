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
    if code.type == :Code
      puts "Interpreter C*de"
      runCode()
    elsif code.type == :ByteCode
      puts "Interpreter ByteC*de"
      runByteCode()
    else
      raise "Interpreter::run(): Unknown code type"
    end
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

  def runByteCode
    while @code.active
      bytecode = @code.get_bytecode
      case bytecode.code
      when '['
        if @tape.get == 0
          depth = 1
          while depth != 0
            @code.forward
            case @code.get_bytecode.code
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
            case @code.get_bytecode.code
            when ']'; depth += 1
            when '['; depth -= 1
            end
          end
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
