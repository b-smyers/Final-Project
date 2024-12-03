module BEQAdder(ValueIn1, ValueIn2, ValueOut, Zero);
    input [31:0] ValueIn1, ValueIn2;  // 32-bit inputs
    output [31:0] ValueOut;          // 32-bit output (sum of inputs)

    assign ValueOut = ValueIn1 + ValueIn2; // Perform addition
endmodule
