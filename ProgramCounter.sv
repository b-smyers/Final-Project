module ProgramCounter(PCIn, Clk, PCOut);
  input [31:0] PCIn; // 32-bit address
  input Clk; // PC is updated on each posedge of Clk. Period may be longer than regular clock!
  output reg [31:0] PCOut; // 32-bit address

  always @(posedge Clk) begin
    PCOut <= PCIn;
  end
endmodule
