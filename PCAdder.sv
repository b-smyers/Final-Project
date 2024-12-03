module PCAdder(PCIn, PCOut);
  input [31:0] PCIn; // 32-bit address
  output [31:0] PCOut; // input incremented by 4

  assign PCOut = PCIn + 4;
endmodule
