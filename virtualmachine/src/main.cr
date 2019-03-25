# Brainf*ck program

require "../src/interpreter"
require "../src/preprocessor"

code : String = ""

if ARGV.size > 0
  file = ARGV[0]
  code = File.read(file)
  if ARGV.size > 0
    puts "Brainf*ck with ByteC*de from '#{file}'"
    preprocessor = Preprocessor.new(code)
    interpreter = Interpreter.new(preprocessor.bytecode)
    interpreter.run
  end
end
