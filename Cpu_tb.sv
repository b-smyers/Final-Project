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
    forever #4 pcClk = ~pcClk;
  end

  // Clock generation for clk (faster clock)
  initial begin
    clk = 0;
    forever #2 clk = ~clk;
  end

  // Memory preloading with instructions
  initial begin
    $display("Loading instructions into Instruction Memory...");
    uut.im.memory[32'h1000] = 32'b00100000000000010010000000000000; // addi $1, $0, 0x2000
    uut.im.memory[32'h1004] = 32'b00100000000000100011000000000000; // addi $2, $0, 0x3000
    uut.im.memory[32'h1008] = 32'b00100000000001000000000000000000; // addi $4, $0, 0x000
    uut.im.memory[32'h100c] = 32'b00100000000001010000000000000000; // addi $5, $0, 0x000
    uut.im.memory[32'h1010] = 32'b00000000101000010011000000100000; // add  $6, $5, $1
    uut.im.memory[32'h1014] = 32'b00000000000001100010100000100000; // add  $5, $0, $6
    uut.im.memory[32'h1018] = 32'b00100000100001100000000000000001; // addi $6, $4, 0x001
    uut.im.memory[32'h101c] = 32'b00000000000001100010000000100000; // add  $4, $0, $6
    uut.im.memory[32'h1020] = 32'b00010100100000101111111111111011; // bne  $4, $2, 0xFFFB
    uut.im.memory[32'h1024] = 32'b10101100011001010000000000000000; // sw   $5, $3, 0x0000
    
    // Store word test
//     uut.im.memory[32'h1000] = 32'b00100000000000010110100101101001;
//     uut.im.memory[32'h1004] = 32'b10101100011000010000000000000000;
    
    
    // Load address into register $3
    $display("Loading address into register...");
    uut.regFile.registers[32'b11] = 32'h4000;
    
    // Initializing Program Counter
    $display("Setting program counter...");
    uut.pc.PCOut = 32'h1000;
    
//     $monitor("Time=%0t, PC=%h, Instruction=%h", $time, uut.PCOut, uut.im.Instruction);
    $dumpfile("dump.vcd");
    $dumpvars;
    $display("Time=%0t", $time);
    $display("Sum =%h", uut.regFile.registers[32'b101]);
    $display("N   =%h", uut.regFile.registers[32'b110]);
    $display("Mem =%h", uut.dataMem.memory[32'h4000]);
    #500000;
    $display("Time=%0t", $time);
    $display("Sum =%h", uut.regFile.registers[32'b101]);
    $display("N   =%h", uut.regFile.registers[32'b110]);
    $display("Mem =%h", uut.dataMem.memory[32'h4000]);
    $finish;
  end
endmodule
