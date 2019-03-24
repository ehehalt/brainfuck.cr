# Brainf*ck Preprocessor
# Translates Brainf*ck code into byte code
# For example: "+++" -> ByteCode.new('+', 3)
# Speed enhancemend (without [ and ] support)
# - Mandelbrot with Code as String:   131s
# - Mandelbrot with Code as ByteCode: 129s

require "../src/brainfuck"
require "../src/bytecode"
require "../src/interpreter"

class Preprocessor
  include Brainfuck

  def initialize(@code : String)
    @bytecode = Array(ByteCode).new
    @loops = Array(ByteCode).new
  end

  def bytecode
    preprocess if @bytecode.size == 0
    @bytecode
  end

  def code
    @code
  end

  def preprocess
    @bytecode.clear
    @loops.clear
    code = ' '
    count = 1
    @code.chars.each do |char|
      if char == code
        count += 1
      else
        append(code, count)
        code = char
        count = 1
      end
    end
    append(code, count)
  end

  def append(code, count)
    if is_code? code
      if code == OP_PUTC ||
         code == OP_GETC
        count.times do
          @bytecode << ByteCode.new(code, 1)
        end
      elsif code == OP_LBEG
        count.times do
          lbeg = ByteCode.new(code, 1)
          lbeg.loop_begin = @bytecode.size # set pos
          @bytecode << lbeg
          @loops.push lbeg
        end
      elsif code == OP_LEND
        count.times do
          lend = ByteCode.new(code, 1)
          lend.loop_end = @bytecode.size # set pos
          @bytecode << lend
          lbeg = @loops.pop?
          if lbeg.nil?
            raise "Unbalanced loops"
          else
            lend.loop_begin = lbeg.loop_begin
            lbeg.loop_end = lend.loop_end
          end
        end
      else
        @bytecode << ByteCode.new(code, count)
      end
    end
  end
end
