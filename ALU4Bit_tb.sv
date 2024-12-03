module ALU4Bit_tb;

    // Inputs
    reg [3:0] a, b;           // 4-bit inputs
    reg [2:0] op;             // Operation code
    reg cin;                  // Carry-in

    // Outputs
    wire [3:0] result;        // 4-bit result
    wire cout;                // Carry-out

    // Instantiate the ALU4Bit module
    ALU4Bit uut (
        .a(a),
        .b(b),
        .op(op),
        .cin(cin),
        .result(result),
        .cout(cout)
    );

    initial begin
        // Initialize inputs
        $display("Starting Testbench...");

        // Test Case 1: AND operation
        a = 4'b1101; b = 4'b1011; op = 3'b000; cin = 0;
        #10;
        $display("Test 1 (AND): a = %b, b = %b, op = %b, result = %b, cout = %b", a, b, op, result, cout);

        // Test Case 2: OR operation
        a = 4'b1101; b = 4'b1011; op = 3'b001; cin = 0;
        #10;
        $display("Test 2 (OR): a = %b, b = %b, op = %b, result = %b, cout = %b", a, b, op, result, cout);

        // Test Case 3: ADD operation
        a = 4'b0101; b = 4'b0011; op = 3'b010; cin = 0;
        #10;
        $display("Test 3 (ADD): a = %b, b = %b, op = %b, result = %b, cout = %b", a, b, op, result, cout);

        // Test Case 4: SUB operation
        a = 4'b0110; b = 4'b0011; op = 3'b110; cin = 1; // Using 2's complement subtraction
        #10;
        $display("Test 4 (SUB): a = %b, b = %b, op = %b, result = %b, cout = %b", a, b, op, result, cout);

        // Test Case 5: LESS comparison
        a = 4'b0010; b = 4'b0100; op = 3'b111; cin = 0;
        #10;
        $display("Test 5 (LESS): a = %b, b = %b, op = %b, result = %b, cout = %b", a, b, op, result, cout);

        // Test Case 6: Carry-out in ADD
        a = 4'b1111; b = 4'b0001; op = 3'b010; cin = 0;
        #10;
        $display("Test 6 (ADD with carry): a = %b, b = %b, op = %b, result = %b, cout = %b", a, b, op, result, cout);

        $display("Testbench complete.");
        $stop;
    end
endmodule
