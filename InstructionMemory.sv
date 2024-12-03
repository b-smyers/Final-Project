module InstructionMemory(Address, Clk, Instruction);
  input [31:0] Address; // 32-bit address to memory.
  input Clk; // very important!
  output [31:0] Instruction; // Value read from memory location Address

endmodule
