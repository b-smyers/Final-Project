module BEQAdder(ValueIn1, ValueIn2, ValueOut, Zero);
    input [31:0] ValueIn1, ValueIn2;  // 32-bit inputs
    output [31:0] ValueOut;          // 32-bit output (sum of inputs)
    output Zero;                     // Zero flag (1 if result is zero)

    assign ValueOut = ValueIn1 + ValueIn2; // Perform addition
    assign Zero = (ValueOut == 32'b0) ? 1'b1 : 1'b0; // Check if the result is zero
endmodule
