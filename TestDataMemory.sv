module test_DataMemory;
    reg [6:0] Address;
    reg [31:0] WriteData;
    reg MemRead, MemWrite, Clk;
    wire [31:0] ReadData;

    // Instantiate the DataMemory module
    DataMemory uut (
        .Address(Address),
        .WriteData(WriteData),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Clk(Clk),
        .ReadData(ReadData)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // Toggle clock every 5 time units
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        // Test writing to memory
        MemWrite = 1; MemRead = 0;
        Address = 7'd10; WriteData = 32'hDEADBEEF; #10; // Write data to address 10
        MemWrite = 1; Address = 7'd20; WriteData = 32'hCAFEBABE; #10; // Write data to address 20

        // Test reading from memory
        MemWrite = 0; MemRead = 1;
        Address = 7'd10; #10;
        $display("ReadData from address 10: %h", ReadData);
        Address = 7'd20; #10;
        $display("ReadData from address 20: %h", ReadData);

        // Test reading from an uninitialized address
        Address = 7'd30; #10;
        $display("ReadData from address 30: %h", ReadData);

        $finish;
    end
endmodule
