module LeftShifterTwoBits_tb;

    // Inputs
    reg [25:0] ValueIn;

    // Outputs
    wire [27:0] ValueOut;

    // Instantiate the LeftShifterTwoBits module
    LeftShifterTwoBits uut (
        .ValueIn(ValueIn),
        .ValueOut(ValueOut)
    );

    initial begin
        $display("Starting Testbench for LeftShifterTwoBits...");

        // Test Case 1: All zeros
        ValueIn = 26'b0;
        #10;
        $display("Test 1: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 2: All ones
        ValueIn = 26'b11111111111111111111111111;
        #10;
        $display("Test 2: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 3: Alternate bits
        ValueIn = 26'b10101010101010101010101010;
        #10;
        $display("Test 3: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 4: Random pattern
        ValueIn = 26'b11001100110011001100110011;
        #10;
        $display("Test 4: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 5: Single bit set
        ValueIn = 26'b00000000000000000000000001;
        #10;
        $display("Test 5: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        $display("Testbench complete.");
        $stop;
    end

endmodule
