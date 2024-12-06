module cpu_tb;
  reg pcClk;
  reg clk;

  // Instantiate the CPU module
  cpu uut (
    .pcClk(pcClk),
    .clk(clk)
  );

  // Clock generation for pcClk (slower clock)
  initial begin
    pcClk = 0;
    forever #10 pcClk = ~pcClk;
  end

  // Clock generation for clk (faster clock)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Memory preloading with instructions
  initial begin
    $display("Loading instructions into Instruction Memory...");
    uut.im.memory[32'h00001000] = 32'b00100000000000010010000000000000;
    uut.im.memory[32'h00001004] = 32'b00100000000000100011000000000000;
    uut.im.memory[32'h00001008] = 32'b00100000000001000000000000000000;
    uut.im.memory[32'h0000100c] = 32'b00100000000001010000000000000000;
    uut.im.memory[32'h00001010] = 32'b00000000101000010011000000100000;
    uut.im.memory[32'h00001014] = 32'b00000000000001100010100000100000;
    uut.im.memory[32'h00001018] = 32'b00100000100001100000000000000001;
    uut.im.memory[32'h0000101c] = 32'b00000000000001100000010000000100;
    uut.im.memory[32'h00001020] = 32'b00010100100000100001000000010000;
    uut.im.memory[32'h00001024] = 32'b10101100101000110000000000000000;
    
    // Load address into register $3
    $display("Loading address into register...");
    uut.dataMem.memory[32'h00004000] = 32'h00004000;
    
    // Initializing Program Counter
    $display("Setting program counter...");
    uut.pc.PCOut = 32'h00001000;
    
    $monitor("Time=%0t, PC=%h, Instruction=%h", $time, uut.PCOut, uut.im.Instruction);
    $dumpfile("dump.vcd");
    $dumpvars;
    #600;
    $finish;
  end
endmodule
