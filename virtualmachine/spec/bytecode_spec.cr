require "./spec_helper"

describe ByteCode do
  it "check initialized byte code" do
    source = '.'
    bytecode = ByteCode.new(source, 2)
    bytecode.code.should eq source
    bytecode.count.should eq 2
    bytecode.loop_begin.should eq -1
    bytecode.loop_end.should eq -1
  end
end
