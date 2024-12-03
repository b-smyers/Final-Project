module LeftShifterWithDiscard(ValueIn, ValueOut); // to calculate BranchAddr for BEQ
  input [31:0] ValueIn; // 32-bit input
  output [31:0] ValueOut; // lower 30 bits of input concatenated with two zeroes

  assign ValueOut = {ValueIn[29:0], 2'b00}; // Remove 2 leading bits and append 2 0's
endmodule
