module testbench;
  reg a, b, cin, less;
  reg [2:0] op;
  
  wire result, cout, g, p, set;
  
  // ALU
  ALU1Bit alu(
    .a(a),
    .b(b),
    .op(op),
    .cin(cin),
    .less(less),
    .result(result),
    .cout(cout),
    .g(g),
    .p(p),
    .set(set));
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    // === AND TESTCASES ===
    $display(" === AND TESTCASES ===");
    a = 0; b = 0; op = 3'b000; cin = 0; less = 0;
    #5;
    $display("| AND 1");
    $display("| Expected: a = 0, b = 0, result = 0");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    a = 0; b = 1; op = 3'b000; cin = 0; less = 0;
    #5;
    $display("| AND 2");
    $display("| Expected: a = 0, b = 1, result = 0");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    a = 1; b = 0; op = 3'b000; cin = 0; less = 0;
    #5;
    $display("| AND 3");
    $display("| Expected: a = 1, b = 0, result = 0");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    a = 1; b = 1; op = 3'b000; cin = 0; less = 0;
    #5;
    $display("| AND 4");
    $display("| Expected: a = 1, b = 1, result = 1");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    // === OR TESTCASES ===
    $display(" === OR TESTCASES ===");
    a = 0; b = 0; op = 3'b001; cin = 0; less = 0;
    #5;
    $display("| OR 1");
    $display("| Expected: a = 0, b = 0, result = 0");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    a = 0; b = 1; op = 3'b001; cin = 0; less = 0;
    #5;
    $display("| OR 2");
    $display("| Expected: a = 0, b = 1, result = 1");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    a = 1; b = 0; op = 3'b001; cin = 0; less = 0;
    #5;
    $display("| OR 3");
    $display("| Expected: a = 1, b = 0, result = 1");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    a = 1; b = 1; op = 3'b001; cin = 0; less = 0;
    #5;
    $display("| OR 4");
    $display("| Expected: a = 1, b = 1, result = 1");
    $display("| Recieved: a = %b, b = %b, result = %b", a, b, result);
    
    // === ADD TESTCASES ===
    $display(" === ADD TESTCASES ===");
    a = 0; b = 0; op = 3'b010; cin = 0; less = 0;
    #5;
    $display("| ADD 1");
    $display("| Expected: a = 0, b = 0, cin = 0, result = 0, g = 0, p = 0");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    a = 0; b = 0; op = 3'b010; cin = 1; less = 0;
    #5;
    $display("| ADD 2");
    $display("| Expected: a = 0, b = 0, cin = 1, result = 1, g = 0, p = 0");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    a = 0; b = 1; op = 3'b010; cin = 0; less = 0;
    #5;
    $display("| ADD 3");
    $display("| Expected: a = 0, b = 1, cin = 0, result = 1, g = 0, p = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    a = 1; b = 1; op = 3'b010; cin = 0; less = 0;
    #5;
    $display("| ADD 4");
    $display("| Expected: a = 1, b = 1, cin = 0, result = 0, g = 1, p = 1, cout = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b, cout = %b", a, b, cin, result, g, p, cout);
    
    a = 1; b = 1; op = 3'b010; cin = 1; less = 0;
    #5;
    $display("| ADD 5");
    $display("| Expected: a = 1, b = 1, cin = 1, result = 1, g = 1, p = 1, cout = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b, cout = %b", a, b, cin, result, g, p, cout);
    
    // === SUB TESTCASES ===
    $display(" === SUB TESTCASES ===");
    a = 0; b = 0; op = 3'b110; cin = 1; less = 0;
    #5;
    $display("| SUB 1");
    $display("| Expected: a = 0, b = 0, cin = 1, result = 0, g = 0, p = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    a = 0; b = 1; op = 3'b110; cin = 1; less = 0;
    #5;
    $display("| SUB 2");
    $display("| Expected: a = 0, b = 1, cin = 1, result = 1, g = 0, p = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    a = 1; b = 0; op = 3'b110; cin = 1; less = 0;
    #5;
    $display("| SUB 3");
    $display("| Expected: a = 1, b = 0, cin = 1, result = 1, g = 1, p = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    a = 1; b = 1; op = 3'b110; cin = 1; less = 0;
    #5;
    $display("| SUB 4");
    $display("| Expected: a = 1, b = 1, cin = 1, result = 0, g = 0, p = 1");
    $display("| Recieved: a = %b, b = %b, cin = %b, result = %b, g = %b, p = %b", a, b, cin, result, g, p);
    
    // === LESS TESTCASES ===
    $display(" === LESS TESTCASES ===");
    a = 0; b = 0; op = 3'b111; cin = 0; less = 0;
    #5;
    $display("| LESS 1");
    $display("| Expected: a = 0, b = 0, less = 0, result = 0, set = 0");
    $display("| Recieved: a = %b, b = %b, less = %b, result = %b, set = %b", a, b, less, result, set);
    
    a = 0; b = 1; op = 3'b111; cin = 0; less = 1;
    #5;
    $display("| LESS 2");
    $display("| Expected: a = 0, b = 1, less = 0, result = 1, set = 1");
    $display("| Recieved: a = %b, b = %b, less = %b, result = %b, set = %b", a, b, less, result, set);
    
    a = 1; b = 0; op = 3'b111; cin = 0; less = 0;
    #5;
    $display("| LESS 3");
    $display("| Expected: a = 1, b = 0, less = 0, result = 0, set = 0");
    $display("| Recieved: a = %b, b = %b, less = %b, result = %b, set = %b", a, b, less, result, set);
    
    a = 1; b = 1; op = 3'b111; cin = 0; less = 0;
    #5;
    $display("| LESS 4");
    $display("| Expected: a = 1, b = 1, less = 0, result = 0, set = 0");
    $display("| Recieved: a = %b, b = %b, less = %b, result = %b, set = %b", a, b, less, result, set);
    
    $finish;
  end
endmodule
