module ALU16Bit_tb;

    // Inputs
    reg [15:0] a, b;          // 16-bit inputs
    reg [2:0] op;             // 3-bit operation code
    reg cin;                  // Carry-in

    // Outputs
    wire [15:0] result;       // 16-bit result
    wire cout;                // Carry-out

    // Instantiate the ALU16Bit module
    ALU16Bit uut (
        .a(a),
        .b(b),
        .op(op),
        .cin(cin),
        .result(result),
        .cout(cout)
    );

    initial begin
        // Initialize inputs
        $display("Starting Testbench for 16-bit ALU...");

        // Test Case 1: AND operation
        a = 16'hFFFF; b = 16'h0F0F; op = 3'b000; cin = 0;
        #10;
        $display("Test 1 (AND): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 2: OR operation
        a = 16'hAAAA; b = 16'h5555; op = 3'b001; cin = 0;
        #10;
        $display("Test 2 (OR): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 3: ADD operation without carry
        a = 16'h1234; b = 16'h5678; op = 3'b010; cin = 0;
        #10;
        $display("Test 3 (ADD without carry): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 4: ADD operation with carry
        a = 16'hFFFF; b = 16'h0001; op = 3'b010; cin = 0;
        #10;
        $display("Test 4 (ADD with carry): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 5: SUB operation
        a = 16'h2000; b = 16'h1000; op = 3'b110; cin = 1; // Using 2's complement subtraction
        #10;
        $display("Test 5 (SUB): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 6: LESS comparison
        a = 16'h0001; b = 16'h0010; op = 3'b111; cin = 0;
        #10;
        $display("Test 6 (LESS): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        // Test Case 7: Large values
        a = 16'hFFFF; b = 16'hFFFF; op = 3'b010; cin = 0;
        #10;
        $display("Test 7 (ADD large values): a = %h, b = %h, op = %b, result = %h, cout = %b", a, b, op, result, cout);

        $display("Testbench complete.");
        $stop;
    end
endmodule
