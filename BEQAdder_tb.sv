module BEQAdder_tb;
    // Inputs
    reg [31:0] ValueIn1;
    reg [31:0] ValueIn2;

    // Outputs
    wire [31:0] ValueOut;

    // Instantiate the BEQAdder module
    BEQAdder uut (
        .ValueIn1(ValueIn1),
        .ValueIn2(ValueIn2),
        .ValueOut(ValueOut)
    );

    initial begin
        // Initialize inputs
        $display("Starting Testbench...");

        // Test Case 1: Zero + Zero
        ValueIn1 = 32'b0;
        ValueIn2 = 32'b0;
        #10;
        $display("Test 1: ValueIn1 = %d, ValueIn2 = %d, ValueOut = %d", ValueIn1, ValueIn2, ValueOut);

        // Test Case 2: Non-zero + Zero
        ValueIn1 = 32'd5;
        ValueIn2 = 32'b0;
        #10;
        $display("Test 2: ValueIn1 = %d, ValueIn2 = %d, ValueOut = %d", ValueIn1, ValueIn2, ValueOut);

        // Test Case 3: Non-zero + Non-zero (Non-zero result)
        ValueIn1 = 32'd10;
        ValueIn2 = 32'd20;
        #10;
        $display("Test 3: ValueIn1 = %d, ValueIn2 = %d, ValueOut = %d", ValueIn1, ValueIn2, ValueOut);

        // Test Case 4: Negative and Positive numbers (Result is Zero)
        ValueIn1 = 32'd10;
        ValueIn2 = -32'd10; // Two's complement representation
        #10;
        $display("Test 4: ValueIn1 = %d, ValueIn2 = %d, ValueOut = %d", ValueIn1, ValueIn2, ValueOut);

        // Test Case 5: Large values
        ValueIn1 = 32'hFFFFFFFF; // -1 in 2's complement
        ValueIn2 = 32'd1;
        #10;
        $display("Test 5: ValueIn1 = %h, ValueIn2 = %d, ValueOut = %h", ValueIn1, ValueIn2, ValueOut);

        $display("Testbench complete.");
        $stop;
    end
endmodule
