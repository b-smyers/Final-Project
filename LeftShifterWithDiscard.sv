module LeftShifterWithDiscard(ValueIn, ValueOut); // to calculate BranchAddr for BEQ
  input [31:0] ValueIn; // 32-bit input
  output [31:0] ValueOut; // lower 30 bits of input concatenated with two zeroes

endmodule
