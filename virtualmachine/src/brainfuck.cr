# Brainf*ck module

module Brainfuck
  OP_VINC = '+' # increment value at memory adress
  OP_VDEC = '-' # decrement value at memory adress
  OP_PINC = '>' # increment memory adress
  OP_PDEC = '<' # decrement memory adress
  OP_PUTC = '.' # output byte at memory adress
  OP_GETC = ',' # input byte into memory adress
  OP_LBEG = '[' # loop begin
  OP_LEND = ']' # loop end

  OPCODES = [
    OP_VINC,
    OP_VDEC,
    OP_PINC,
    OP_PDEC,
    OP_PUTC,
    OP_GETC,
    OP_LBEG,
    OP_LEND,
  ]

  def is_code?(code)
    OPCODES.includes? code
  end
end
