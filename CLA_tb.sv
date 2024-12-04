module testbench;
  reg g0, p0, g1, p1, g2, p2, g3, p3, cin;
  wire C1, C2, C3, C4, G, P;
  
  CLA cla(
    .g0(g0),
    .p0(p0),
    .g1(g1),
    .p1(p1),
    .g2(g2),
    .p2(p2),
    .g3(g3),
    .p3(p3),
    .cin(cin),
    .C1(C1),
    .C2(C2),
    .C3(C3),
    .C4(C4),
    .G(G),
    .P(P));
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    // === Testcase 1 ===
    g0 = 0; p0 = 1;
    g1 = 1; p1 = 0;
    g2 = 0; p2 = 1;
    g3 = 1; p3 = 1;
    cin = 1;
    #5;
    $display(" === Testcase 1 ===");
    $display("Expected: C1 = 1, C2 = 1, C3 = 1, C4 = 1, G = 1, P = 0");
    $display("Recieved: C1 = %b, C2 = %b, C3 = %b, C4 = %b, G = %b, P = %b", C1, C2, C3, C4, G, P);
    
    // === Testcase 2 ===
    g0 = 0; p0 = 1;
    g1 = 1; p1 = 1;
    g2 = 0; p2 = 0;
    g3 = 1; p3 = 0;
    cin = 1;
    #5;
    $display(" === Testcase 2 ===");
    $display("Expected: C1 = 1, C2 = 1, C3 = 0, C4 = 1, G = 1, P = 0");
    $display("Recieved: C1 = %b, C2 = %b, C3 = %b, C4 = %b, G = %b, P = %b", C1, C2, C3, C4, G, P);
    
    // === Testcase 3 ===
    g0 = 0; p0 = 0;
    g1 = 0; p1 = 0;
    g2 = 0; p2 = 0;
    g3 = 0; p3 = 0;
    cin = 0;
    #5;
    $display(" === Testcase 3 ===");
    $display("Expected: C1 = 0, C2 = 0, C3 = 0, C4 = 0, G = 0, P = 0");
    $display("Recieved: C1 = %b, C2 = %b, C3 = %b, C4 = %b, G = %b, P = %b", C1, C2, C3, C4, G, P);
    
    // === Testcase 4 ===
    g0 = 1; p0 = 1;
    g1 = 1; p1 = 1;
    g2 = 1; p2 = 1;
    g3 = 1; p3 = 1;
    cin = 0;
    #5;
    $display(" === Testcase 4 ===");
    $display("Expected: C1 = 1, C2 = 1, C3 = 1, C4 = 1, G = 1, P = 1");
    $display("Recieved: C1 = %b, C2 = %b, C3 = %b, C4 = %b, G = %b, P = %b", C1, C2, C3, C4, G, P);
    
    // === Testcase 5 ===
    g0 = 1; p0 = 0;
    g1 = 0; p1 = 0;
    g2 = 0; p2 = 1;
    g3 = 1; p3 = 0;
    cin = 0;
    #5;
    $display(" === Testcase 5 ===");
    $display("Expected: C1 = 1, C2 = 0, C3 = 0, C4 = 1, G = 1, P = 0");
    $display("Recieved: C1 = %b, C2 = %b, C3 = %b, C4 = %b, G = %b, P = %b", C1, C2, C3, C4, G, P);
    
    $finish;
  end
  
endmodule