module PCAdder_tb;

    // Inputs
    reg [31:0] PCIn;

    // Outputs
    wire [31:0] PCOut;

    // Instantiate the PCAdder module
    PCAdder uut (
        .PCIn(PCIn),
        .PCOut(PCOut)
    );

    initial begin
        $display("Starting Testbench for PCAdder...");

        // Test Case 1: Start at zero
        PCIn = 32'd0;
        #10;
        $display("Test 1: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 2: Small address
        PCIn = 32'd4;
        #10;
        $display("Test 2: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 3: Large address
        PCIn = 32'hFFFFFFFC; // Max 32-bit address aligned to 4
        #10;
        $display("Test 3: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 4: Non-aligned address
        PCIn = 32'd5;
        #10;
        $display("Test 4: PCIn = %h, PCOut = %h", PCIn, PCOut);

        // Test Case 5: Random address
        PCIn = 32'h12345678;
        #10;
        $display("Test 5: PCIn = %h, PCOut = %h", PCIn, PCOut);

        $display("Testbench complete.");
        $stop;
    end

endmodule
