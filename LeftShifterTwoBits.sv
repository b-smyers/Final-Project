module LeftShifterTwoBits(ValueIn, ValueOut); // to calc. JumpAddr for J instruction
  input [25:0] ValueIn; // 26-bit input
  output [27:0] ValueOut; // 28-bit output

  assign ValueOut = {ValueIn, 2'b00}; // Append 2 bits (basically shift left)
endmodule
