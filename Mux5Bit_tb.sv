module testbench;
  reg [4:0] a, b;
  reg op;

  wire [4:0] result;

  // ALU
  Mux5Bit2To1 mux(
    .a(a),
    .b(b),
    .op(op),
    .result(result)
  );

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    // === Testcase 1: Option 0 ===
    a = 5'b00000; b = 5'b11111;
    op = 1'b0;
    #2;
    $display(" === Testcase 1: Option 0 ===");
    $display("Expected: Result = 00000");
    $display("Received: Result = %b", result);
    
    // === Testcase 2: Option 1 ===
    op = 1'b1;
    #2;
    $display(" === Testcase 2: Option 1 ===");
    $display("Expected: Result = 11111");
    $display("Received: Result = %b", result);
    
    $finish;
  end
endmodule
