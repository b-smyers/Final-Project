module Mux32Bit2To1(a, b, op, result);
  input [31:0] a, b; // 32-bit inputs
  input op; // one-bit selection input
  output [31:0] result; // 32-bit output
  
  assign result = (op == 1'b0) ? a : b;
endmodule