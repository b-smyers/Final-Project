module InstructionMemory(Address, Clk, Instruction);
  input [31:0] Address; // 32-bit address to memory.
  input Clk; // very important!
  output reg [31:0] Instruction; // Value read from memory location Address

  reg [31:0] memory [0:4499]; // 16 words of memory

  integer i;
  initial begin
    for (i = 0; i < 4499; i = i + 1) begin
      memory[i] = 32'd0;
    end
  end

  always @(posedge Clk) begin
    Instruction <= memory[Address];
  end
endmodule

