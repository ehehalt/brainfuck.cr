require "./spec_helper"

describe Code do
  it "check initialized tape" do
    source = ".<>,"
    code = Code.new(source)
    code.get.should eq '.'
    code.pos.should eq 0
    code.active.should eq true
    source.size.times { code.forward }
    code.pos.should eq 4
    code.active.should eq false
    code.type.should eq :Code
  end

  it "check backward exception" do
    source = ".<>,"
    code = Code.new(source)
    code.get.should eq '.'
    code.pos.should eq 0
    begin
      code.backward
    rescue
      true.should eq true
    else
      false.should eq true
    end
  end
end
