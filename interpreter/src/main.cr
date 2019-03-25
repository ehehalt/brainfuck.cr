# Brainf*ck program

require "../src/interpreter"

code : String = ""

if ARGV.size > 0
  file = ARGV[0]
  code = File.read(file)
  puts "Brainf*ck Interpreter with C*de '#{file}'"
  interpreter = Interpreter.new(code)
  interpreter.run
end
