module LeftShifterWithDiscard_tb;

    // Inputs
    reg [31:0] ValueIn;

    // Outputs
    wire [31:0] ValueOut;

    // Instantiate the LeftShifterWithDiscard module
    LeftShifterWithDiscard uut (
        .ValueIn(ValueIn),
        .ValueOut(ValueOut)
    );

    initial begin
        $display("Starting Testbench for LeftShifterWithDiscard...");

        // Test Case 1: All zeros
        ValueIn = 32'b0;
        #10;
        $display("Test 1: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 2: All ones
        ValueIn = 32'b11111111111111111111111111111111;
        #10;
        $display("Test 2: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 3: Alternate bits
        ValueIn = 32'b10101010101010101010101010101010;
        #10;
        $display("Test 3: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 4: Random pattern
        ValueIn = 32'b11001100110011001100110011001100;
        #10;
        $display("Test 4: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 5: Single bit set at MSB
        ValueIn = 32'b10000000000000000000000000000000;
        #10;
        $display("Test 5: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        // Test Case 6: Single bit set at LSB
        ValueIn = 32'b00000000000000000000000000000001;
        #10;
        $display("Test 6: ValueIn = %b, ValueOut = %b", ValueIn, ValueOut);

        $display("Testbench complete.");
        $stop;
    end

endmodule
