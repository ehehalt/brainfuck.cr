require "./spec_helper"

describe Interpreter do
  it "check interpreting" do
    code = "+>+>+>+"
    # interpreter
    interpreter = Interpreter.new(code)
    interpreter.run
    # code
    interpreter.code.code.should eq code
    interpreter.code.pos.should eq 7
    # tape
    interpreter.tape.tape.size.should eq 4
    interpreter.tape.tape[0..10].should eq [1, 1, 1, 1]
    interpreter.tape.pos.should eq 3
  end
end
