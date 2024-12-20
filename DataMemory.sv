module DataMemory(
    input [31:0] Address,      // 32-bit address input
    input [31:0] WriteData,     // 32-bit data to be written
    input MemRead,              // Control signal for reading
    input MemWrite,             // Control signal for writing
    input Clk,                  // Clock signal
    output reg [31:0] ReadData  // 32-bit data output
);

    reg [31:0] memory [0:16499];
    integer i;
    initial begin
      for (i = 0; i < 16500; i = i + 1) begin
        memory[i] = 32'd0;
      end
    end

    // Asynchronous read
    always @(*) begin
        if (MemRead) begin
            ReadData = memory[Address]; // Read data from memory if MemRead is high
        end else begin
            ReadData = 32'b0; // Default to zero if MemRead is not active
        end
    end

    // Synchronous write on positive clock edge
    always @(posedge Clk) begin
        if (MemWrite) begin
            memory[Address] <= WriteData; // Write data to memory if MemWrite is high
        end
    end

endmodule

