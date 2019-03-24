require "./spec_helper"

describe Tape do
  # TODO: Write tests

  it "check initialized tape" do
    tape = Tape.new
    tape.get.should eq 0
    tape.pos.should eq 0
  end

  it "check forward" do
    tape = Tape.new
    tape.forward
    tape.get.should eq 0
    tape.pos.should eq 1
  end

  it "check underflow" do
    tape = Tape.new
    tape.decrease
    tape.get.should eq 255
  end

  it "check overflow" do
    tape = Tape.new
    255.times { tape.increase }
    tape.increase
    tape.get.should eq 0
  end

  it "check raise backward" do
    tape = Tape.new
    begin
      tape.backward
    rescue
      true.should eq true
    else
      false.should eq true
    end
  end
end
