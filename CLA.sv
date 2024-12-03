module CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, G, P);
  input g0, p0, g1, p1, g2, p2, g3, p3; // Generate and propagate signals corresponding to each bit.
  input cin; // Carry-in input (C0)
  output C1, C2, C3, C4; // Carry bits computed by the CLA.
  output G, P; // Block generate and block propagate to be used by CLAs at a higher level.
  
  // C1 = g0 + p0*cin
  // C2 = g1 + p1*C1
  // C3 = g2 + p2*C2
  // C4 = g3 + p3*C3
  // G = g3 + p3*g2 + p3*p2*g1 + p3*p2*p1*g0
  // P = p3*p2*p1*p0
  
  assign C1 = g0 | (p0 & cin);
  assign C2 = g1 | (p1 & C1);
  assign C3 = g2 | (p2 & C2);
  assign C4 = g3 | (p3 & C3);
  
  assign G = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0);
  assign P = p3 & p2 & p1 & p0;
  
endmodule