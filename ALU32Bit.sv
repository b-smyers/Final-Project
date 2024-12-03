module ALU32Bit(a, b, op, cin, result, cout, zero);
    input [31:0] a, b;          // 32-bit inputs
    input [2:0] op;             // 3-bit operation code
    input cin;                  // Initial carry-in
    output [31:0] result;       // 32-bit result
    output cout;                // Final carry-out
    output zero;                // zero flag


    wire c;                     // Carry signal between the two 16-bit ALUs

    // Instantiate 16-bit ALUs
    ALU16Bit alu0(
        .a(a[15:0]),
        .b(b[15:0]),
        .op(op),
        .cin(cin),
        .result(result[15:0]),
        .cout(c)
    );

    ALU16Bit alu1(
        .a(a[31:16]),
        .b(b[31:16]),
        .op(op),
        .cin(c),
        .result(result[31:16]),
        .cout(cout)
    );
   assign zero = (result == 32'b0) ? 1'b1 : 1'b0;
endmodule
