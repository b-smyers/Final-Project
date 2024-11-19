module ALU1Bit(a, b, op, cin, less, result, cout, g, p, set);
  input a, b, cin; // Inputs to the one-bit ALU, "cin" is the carry-in bit.
  input [2:0] op; // 3-bit operation code. op[2] is the "binv". op[0] is the least significant bit.
  input less; // This input will be set as 0 for all ALUs but the one corresponding to the most-significant bit.
  output result;
  output cout; // Carry bit
  output g, p; // Generate and propagate signals for the CLA unit.
  output set; // Used in multi-bit ALUs to track comparison result.
  
  wire B_out; // Inverted b if needed for SUB
  wire AND_out, OR_out, FA_sum;
  
  // Invert b if needed for SUB operation
  assign B_out = op[2] ? ~b : b;
  
  // AND and OR outputs
  assign AND_out = a & B_out;
  assign OR_out = a | B_out;

  // Full-Adder (for ADD/SUB)
  assign FA_sum = a ^ B_out ^ cin;
  assign cout = (a & B_out) | (cin & (a ^ B_out));
  
  // Generate and propagate signals for CLA
  assign g = (op == 3'b010 || op == 3'b110) ? (a & B_out) : 1'b0;
  assign p = (op == 3'b010 || op == 3'b110) ? ((a | B_out) | (op == 3'b110 && cin)) : 1'b0; // Modified propagate for SUB
  
  // Set flag (for LESS comparisons)
  assign set = (op == 3'b111) ? ((a < b) ? 1 : 0) : 1'b0;
  
  // Multiplexer to select output
  assign result = (op == 3'b000) ? AND_out :    // AND
                  (op == 3'b001) ? OR_out :     // OR
                  (op == 3'b010 || op == 3'b110) ? FA_sum : // ADD/SUB
                  (op == 3'b111) ? less :       // LESS
                  1'b0;                         // Default
endmodule
