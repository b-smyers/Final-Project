module ALU16Bit(a, b, op, cin, result, cout);
    input [15:0] a, b;         // 16-bit inputs
    input [2:0] op;            // 3-bit operation code
    input cin;                 // Initial carry-in
    output [15:0] result;      // 16-bit result
    output cout;               // Final carry-out

    wire [3:0] c;              // Internal carry signals between 4-bit ALUs
    wire set[3:0];             // Set signals for LESS comparisons

    // Instantiate 4-bit ALUs
    ALU4Bit alu0(.a(a[3:0]), .b(b[3:0]), .op(op), .cin(cin), .result(result[3:0]), .cout(c[0]));
    ALU4Bit alu1(.a(a[7:4]), .b(b[7:4]), .op(op), .cin(c[0]), .result(result[7:4]), .cout(c[1]));
    ALU4Bit alu2(.a(a[11:8]), .b(b[11:8]), .op(op), .cin(c[1]), .result(result[11:8]), .cout(c[2]));
    ALU4Bit alu3(.a(a[15:12]), .b(b[15:12]), .op(op), .cin(c[2]), .result(result[15:12]), .cout(cout));

    // The "set" output can be used for LESS comparisons in higher designs if required.
endmodule
