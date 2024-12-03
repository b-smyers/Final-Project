module Mux5Bit2To1(a, b, op, result);
  input [4:0] a, b; // 32-bit inputs
  input op; // one-bit selection input
  output [4:0] result; // 32-bit output
  
  assign result = (op == 1'b0) ? a : b;
endmodule