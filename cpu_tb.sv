`timescale 1ns/1ps
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
    forever #20 pcClk = ~pcClk; // 50 MHz clock
  end

  // Clock generation for clk (faster clock)
  initial begin
    clk = 0;
    forever #10 clk = ~clk; // 100 MHz clock
  end

  // Memory preloading with instructions
  initial begin
    $display("Loading instructions into Instruction Memory...");
    uut.im.memory[8'h0] = 32'b00100000000010000000000000000101; // addi $t0, $zero, 5
    uut.im.memory[8'h4] = 32'b00100000000010010000000000001010; // addi $t1, $zero, 10
    uut.im.memory[8'h8] = 32'b00000001000010010101000000100000; // add $t2, $t0, $t1
    uut.im.memory[8'hc] = 32'b00010001010000000000000000000010; // beq $t2, $zero, LABEL
    uut.im.memory[8'h10] = 32'b10101100000010100000000000000000; // sw $t2, 0($zero)
    uut.im.memory[8'h14] = 32'b00001000000000000000000000000110; // j END
    uut.im.memory[8'h18] = 32'b00100000000010110000000011111111; // addi $t3, $zero, -1 (LABEL)
    $monitor("Time=%0t, PC=%h, Instruction=%h", $time, uut.PCOut, uut.im.Instruction);
    #500;
    $finish;
  end
endmodule

