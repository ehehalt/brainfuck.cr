# Brainf*ck program

require "../src/interpreter"

code : String = ""

if ARGV.size > 0
  code = File.read(ARGV[0])
  puts "Brainf*ck with C*de"
  interpreter = Interpreter.new(code)
  interpreter.run
end
