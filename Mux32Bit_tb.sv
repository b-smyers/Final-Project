module testbench;
  reg [31:0] a, b;
  reg op;

  wire [31:0] result;

  // ALU
  Mux32Bit2To1 mux(
    .a(a),
    .b(b),
    .op(op),
    .result(result)
  );

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    // === Testcase 1: Option 0 ===
    a = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    b = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    op = 1'b0;
    #2;
    $display(" === Testcase 1: Option 0 ===");
    $display("Expected: Result = 00000000000000000000000000000000");
    $display("Received: Result = %b", result);
    
    // === Testcase 2: Option 1 ===
    op = 1'b1;
    #2;
    $display(" === Testcase 2: Option 1 ===");
    $display("Expected: Result = 11111111111111111111111111111111");
    $display("Received: Result = %b", result);
    
    $finish;
  end
endmodule
