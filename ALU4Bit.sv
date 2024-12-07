module ALU4Bit(a, b, op, cin, result, cout);
    input [3:0] a, b;          // 4-bit inputs
    input [2:0] op;            // 3-bit operation code
    input cin;                 // Initial carry-in
    output [3:0] result;       // 4-bit result
    output cout;               // Final carry-out

    wire [3:0] c;              // Internal carry signals
    wire less;                 // Less flag for the MSB comparison
    wire g[3:0], p[3:0];       // Generate and propagate signals
    wire set;                  // Set flag for comparison

  	CLA cla(.g0(g[0]), .p0(p[0]), .g1(g[1]), .p1(p[1]), .g2(g[2]), .p2(p[2]), .g3(g[3]), .p3(p[3]), .cin(cin), .C1(c[0]), .C2(c[1]), .C3(c[2]), .C4(cout), .G(), .P());
  
    // Instantiate 1-bit ALUs
    ALU1Bit alu0(.a(a[0]), .b(b[0]), .op(op), .cin(cin), .less(1'b0), .result(result[0]), .cout(), .g(g[0]), .p(p[0]), .set());
    ALU1Bit alu1(.a(a[1]), .b(b[1]), .op(op), .cin(c[0]), .less(1'b0), .result(result[1]), .cout(), .g(g[1]), .p(p[1]), .set());
    ALU1Bit alu2(.a(a[2]), .b(b[2]), .op(op), .cin(c[1]), .less(1'b0), .result(result[2]), .cout(), .g(g[2]), .p(p[2]), .set());
    ALU1Bit alu3(.a(a[3]), .b(b[3]), .op(op), .cin(c[2]), .less(set), .result(result[3]), .cout(), .g(g[3]), .p(p[3]), .set(set));

    // Determine less flag based on MSB
    assign less = set; // The set output can determine the comparison result.
endmodule
