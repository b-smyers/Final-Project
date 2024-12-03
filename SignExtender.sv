module SignExtension(a, result);
    input [15:0] a;         // 16-bit input
    output [31:0] result;   // 32-bit output
    reg [31:0] result;      // Define result as a register to use in always block

    always @(*) begin
        // Check the sign bit (MSB of `a`) to determine how to extend
        if (a[15] == 1'b1)
            result = {16'b1111111111111111, a};  // If negative, extend with 1's
        else
            result = {16'b0000000000000000, a};  // If positive, extend with 0's
    end
endmodule
