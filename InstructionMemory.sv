module InstructionMemory(Address, Clk, Instruction);
  input [31:0] Address; // 32-bit address to memory.
  input Clk; // very important!
  output reg [31:0] Instruction; // Value read from memory location Address

  reg [31:0] memory [15:0]; // 16 words of memory

  initial begin
    memory[8'h0] = 32'b0;
    memory[8'h4] = 32'b0;
    memory[8'h8] = 32'b0;
    memory[8'hc] = 32'b0;
    memory[8'h10] = 32'b0;
    memory[8'h14] = 32'b0;
    memory[8'h18] = 32'b0;
    memory[8'h1c] = 32'b0;
    memory[8'h20] = 32'b0;
    memory[8'h24] = 32'b0;
    memory[8'h28] = 32'b0;
    memory[8'h2c] = 32'b0;
    memory[8'h30] = 32'b0;
    memory[8'h34] = 32'b0;
    memory[8'h38] = 32'b0;
    memory[8'h3c] = 32'b0;
  end

  always @(posedge Clk) begin
    Instruction <= memory[Address];
  end
endmodule
