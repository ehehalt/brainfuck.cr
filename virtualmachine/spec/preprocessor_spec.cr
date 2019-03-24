require "./spec_helper"

describe Preprocessor do
  it "check empty" do
    preprocessor = Preprocessor.new("")
    preprocessor.bytecode.size.should eq 0
    preprocessor.code.size.should eq 0
  end

  it "check simple" do
    preprocessor = Preprocessor.new("++")

    code = preprocessor.code
    code.size.should eq 2

    bytecode = preprocessor.bytecode
    bytecode.size.should eq 1
    element = bytecode[0]
    element.code.should eq '+'
    element.count.should eq 2
  end

  it "check complicated" do
    preprocessor = Preprocessor.new("++--<<>>,,..")

    code = preprocessor.code
    code.size.should eq 12

    bytecode = preprocessor.bytecode
    bytecode.size.should eq 8
    element = bytecode[4]
    element.code.should eq ','
    element.count.should eq 1
  end

  it "check loops" do
    preprocessor = Preprocessor.new("[[]][]")

    code = preprocessor.code
    code.size.should eq 6

    bytecode = preprocessor.bytecode
    bytecode.size.should eq 6
    element = bytecode[0]
    element.code.should eq '['
    element.count.should eq 1
    element.loop_begin.should eq 0
    element.loop_end.should eq 3
  end
end
