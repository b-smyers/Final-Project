module InstructionMemory_tb;

    // Inputs
    reg [31:0] Address;    // Address to read from memory
    reg Clk;               // Clock signal

    // Outputs
    wire [31:0] Instruction;  // Instruction read from memory

    // Instantiate the InstructionMemory module
    InstructionMemory uut (
        .Address(Address),
        .Clk(Clk),
        .Instruction(Instruction)
    );

    // Initialize memory with some test values
    initial begin
        // Initializing memory for testing
        uut.memory[0] = 32'h12345678;
        uut.memory[1] = 32'h9ABCDEF0;
        uut.memory[2] = 32'h2468ACEF;
        uut.memory[3] = 32'h13579BDF;
        uut.memory[4] = 32'h11112222;
        uut.memory[5] = 32'h33334444;
        uut.memory[6] = 32'h55556666;
        uut.memory[7] = 32'h77778888;
    end

    // Clock signal generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;  // Generate a clock with a period of 10 time units
    end

    // Stimulus to test the module
    initial begin
        $display("Starting Testbench for InstructionMemory...");

        // Test Case 1: Read from Address 0
        Address = 32'd0;
        #10;
        $display("Test 1: Address = %d, Instruction = %h", Address, Instruction);

        // Test Case 2: Read from Address 1
        Address = 32'd1;
        #10;
        $display("Test 2: Address = %d, Instruction = %h", Address, Instruction);

        // Test Case 3: Read from Address 2
        Address = 32'd2;
        #10;
        $display("Test 3: Address = %d, Instruction = %h", Address, Instruction);

        // Test Case 4: Read from Address 3
        Address = 32'd3;
        #10;
        $display("Test 4: Address = %d, Instruction = %h", Address, Instruction);

        // Test Case 5: Out-of-bound Address (Address = 8, uninitialized memory)
        Address = 32'd8;
        #10;
        $display("Test 5: Address = %d, Instruction = %h (uninitialized)", Address, Instruction);

        $display("Testbench complete.");
        $stop;
    end

endmodule
