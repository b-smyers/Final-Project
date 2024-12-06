module RegisterFile(
    input [4:0] ReadRegister1, ReadRegister2, WriteRegister,
    input [31:0] WriteData,
    input RegWrite, Clk,
    output [31:0] ReadData1, ReadData2
);

    // Define a register array with 32 registers, each 32 bits wide
  	reg [31:0] registers [0:31];
  
    integer i;
    initial begin
      for (i = 0; i < 32; i = i + 1) begin
        registers[i] = 32'd0;
      end
    end

    // Asynchronous read operations
    assign ReadData1 = (ReadRegister1 == 5'b00000) ? 32'b0 : registers[ReadRegister1];
    assign ReadData2 = (ReadRegister2 == 5'b00000) ? 32'b0 : registers[ReadRegister2];

    // Synchronous write operation on the positive edge of the clock
    always @(posedge Clk) begin
        if (RegWrite && WriteRegister != 5'b00000) begin
            registers[WriteRegister] <= WriteData;
        end
    end

endmodule

