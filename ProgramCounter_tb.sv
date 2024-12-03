module ProgramCounter_tb;

    // Inputs
    reg [31:0] PCIn;   // Program counter input
    reg Clk;           // Clock signal

    // Outputs
    reg [31:0] PCOut;  // Program counter output

    // Instantiate the ProgramCounter module
    ProgramCounter uut (
        .PCIn(PCIn),
        .Clk(Clk),
        .PCOut(PCOut)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;  // Generate a clock with a 10 time unit period
    end

    // Test stimulus
    initial begin
        $display("Starting Testbench for ProgramCounter...");

        // Initialize PCOut
        PCOut = 32'd0;

        // Test Case 1: Set PC to 0x00000004
        PCIn = 32'h00000004;
        #10;  // Wait for the clock edge
        $display("Test 1: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 2: Increment PC to 0x00000008
        PCIn = 32'h00000008;
        #10;
        $display("Test 2: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 3: Update PC to a large value
        PCIn = 32'hFFFFFFFC;
        #10;
        $display("Test 3: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 4: Update PC with a random value
        PCIn = 32'h12345678;
        #10;
        $display("Test 4: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 5: Update PC to zero
        PCIn = 32'h00000000;
        #10;
        $display("Test 5: PCIn = %h, PCOut = %h", PCIn, PCOut);

        $display("Testbench complete.");
        $stop;
    end

endmodule
