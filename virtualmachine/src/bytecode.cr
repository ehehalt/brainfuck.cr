# Brainf*ck Byte Code

class ByteCode
  property code
  property count
  property loop_begin : Int32 = -1
  property loop_end : Int32 = -1

  def initialize(@code : Char, @count : Int32)
  end
end
