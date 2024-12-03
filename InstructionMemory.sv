module InstructionMemory(Address, Clk, Instruction);
  input [31:0] Address; // 32-bit address to memory.
  input Clk; // very important!
  output [31:0] Instruction; // Value read from memory location Address

  reg [31:0] memory [15:0]; // 16 words of memory

  // Load instructions here
  // initial begin
    // memory[0] = 32'h2468ACEF;
    // etc.
  // end

  always @(posedge Clk) begin
    Instruction <= memory[Address];
  end
endmodule
