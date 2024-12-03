module test_RegisterFile;
    reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    reg [31:0] WriteData;
    reg RegWrite, Clk;
    wire [31:0] ReadData1, ReadData2;

    // Instantiate the RegisterFile module
    RegisterFile uut (
        .ReadRegister1(ReadRegister1),
        .ReadRegister2(ReadRegister2),
        .WriteRegister(WriteRegister),
        .WriteData(WriteData),
        .RegWrite(RegWrite),
        .Clk(Clk),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // Toggle clock every 5 time units
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        // Test writing to registers
        RegWrite = 1; WriteRegister = 5'd1; WriteData = 32'hA5A5A5A5; #10;
        RegWrite = 1; WriteRegister = 5'd2; WriteData = 32'h5A5A5A5A; #10;

        // Test reading from registers
        ReadRegister1 = 5'd1; ReadRegister2 = 5'd2; #10;
        $display("ReadData1: %h, ReadData2: %h", ReadData1, ReadData2);

        // Test writing to register 0 (should not change)
        RegWrite = 1; WriteRegister = 5'd0; WriteData = 32'hDEADBEEF; #10;

        // Test reading from register 0
        ReadRegister1 = 5'd0; #10;
        $display("ReadData1 (should be 0): %h", ReadData1);

        $finish;
    end
endmodule
