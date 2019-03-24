# Brainf*ck program

require "../src/interpreter"
require "../src/preprocessor"

code : String = ""

if ARGV.size > 0
  code = File.read(ARGV[0])
  if ARGV.size > 1
    puts "Brainf*ck with ByteC*de"
    preprocessor = Preprocessor.new(code)
    interpreter = Interpreter.new(preprocessor.bytecode)
    interpreter.run
  else
    puts "Brainf*ck with C*de"
    interpreter = Interpreter.new(code)
    interpreter.run
  end
end
