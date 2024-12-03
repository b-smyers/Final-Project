module ALU32Bit_tb;

    // Inputs
    reg [31:0] a, b;           // 32-bit inputs
    reg [2:0] op;              // 3-bit operation code
    reg cin;                   // Carry-in

    // Outputs
    wire [31:0] result;        // 32-bit result
    wire cout;                 // Carry-out
    wire zero;                 // zero flag

    // Instantiate the ALU32Bit module
    ALU32Bit uut (
        .a(a),
        .b(b),
        .op(op),
        .cin(cin),
        .result(result),
        .cout(cout),
        .zero(zero)
    );

    initial begin
        // Initialize inputs
        $display("Starting Testbench for ALU32Bit...");

        // Test Case 1: AND operation
        a = 32'hFFFFFFFF; b = 32'h0F0F0F0F; op = 3'b000; cin = 0;
        #10;
        $display("Test 1 (AND): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 2: OR operation
        a = 32'hAAAAAAAA; b = 32'h55555555; op = 3'b001; cin = 0;
        #10;
        $display("Test 2 (OR): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 3: ADD operation without carry
        a = 32'h12345678; b = 32'h87654321; op = 3'b010; cin = 0;
        #10;
        $display("Test 3 (ADD without carry): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 4: ADD operation with carry
        a = 32'hFFFFFFFF; b = 32'h00000001; op = 3'b010; cin = 0;
        #10;
        $display("Test 4 (ADD with carry): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 5: SUB operation
        a = 32'h20000000; b = 32'h10000000; op = 3'b110; cin = 1; // Using 2's complement subtraction
        #10;
        $display("Test 5 (SUB): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 6: LESS comparison
        a = 32'h00000001; b = 32'h00000010; op = 3'b111; cin = 0;
        #10;
        $display("Test 6 (LESS): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 7: Large values
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; op = 3'b010; cin = 0;
        #10;
        $display("Test 7 (ADD large values): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        $display("Testbench complete.");
        $stop;
    end
endmodule
