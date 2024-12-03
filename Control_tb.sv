module test_Control;

// Inputs
    reg [5:0] opcode;
    reg [5:0] funct;

    // Outputs
    wire ALUSrc;
    wire RegDst;
    wire MemWrite;
    wire MemRead;
    wire Beq;
    wire Bne;
    wire Jump;
    wire MemToReg;
    wire RegWrite;
    wire [2:0] ALUControl;

    // Instantiate the Control Unit
    Control uut (
        .opcode(opcode),
        .funct(funct),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Beq(Beq),
        .Bne(Bne),
        .Jump(Jump),
        .MemToReg(MemToReg),
        .RegWrite(RegWrite),
        .ALUControl(ALUControl)
    );

    // Test cases
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        // Monitor output
        $monitor("Opcode=%b Funct=%b | ALUSrc=%b, RegDst=%b, MemWrite=%b, MemRead=%b, Beq=%b, Bne=%b, Jump=%b, MemToReg=%b, RegWrite=%b, ALUControl=%b",
                 opcode, funct, ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl);

        // Test case for R-type add
        opcode = 6'b000000; funct = 6'b100000; #10;  // add funct code
        if (ALUSrc !== 0 || RegDst !== 1 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 1 || ALUControl !== 3'b010)
            $display("Test failed for R-type add");

        // Test case for R-type sub
        opcode = 6'b000000; funct = 6'b100010; #10;  // sub funct code
        if (ALUSrc !== 0 || RegDst !== 1 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 1 || ALUControl !== 3'b110)
            $display("Test failed for R-type sub");

        // Test case for R-type and
        opcode = 6'b000000; funct = 6'b100100; #10;  // and funct code
        if (ALUSrc !== 0 || RegDst !== 1 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 1 || ALUControl !== 3'b000)
            $display("Test failed for R-type and");

        // Test case for R-type or
        opcode = 6'b000000; funct = 6'b100101; #10;  // or funct code
        if (ALUSrc !== 0 || RegDst !== 1 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 1 || ALUControl !== 3'b001)
            $display("Test failed for R-type or");

        // Test case for R-type slt
        opcode = 6'b000000; funct = 6'b101010; #10;  // slt funct code
        if (ALUSrc !== 0 || RegDst !== 1 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 1 || ALUControl !== 3'b111)
            $display("Test failed for R-type slt");

        // Test case for lw (Load Word)
        opcode = 6'b100011; funct = 6'bxxxxxx; #10;  // lw opcode
        if (ALUSrc !== 1 || RegDst !== 0 || MemWrite !== 0 || MemRead !== 1 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 1 || RegWrite !== 1 || ALUControl !== 3'b010)
            $display("Test failed for lw");

        // Test case for sw (Store Word)
        opcode = 6'b101011; funct = 6'bxxxxxx; #10;  // sw opcode
        if (ALUSrc !== 1 || RegDst !== 0 || MemWrite !== 1 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 0 || ALUControl !== 3'b010)
            $display("Test failed for sw");

        // Test case for beq (Branch Equal)
        opcode = 6'b000100; funct = 6'bxxxxxx; #10;  // beq opcode
        if (ALUSrc !== 0 || RegDst !== 0 || MemWrite !== 0 || MemRead !== 0 || Beq !== 1 || Bne !== 0 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 0 || ALUControl !== 3'b110)
            $display("Test failed for beq");

        // Test case for bne (Branch Not Equal)
        opcode = 6'b000101; funct = 6'bxxxxxx; #10;  // bne opcode
        if (ALUSrc !== 0 || RegDst !== 0 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 1 || Jump !== 0 || MemToReg !== 0 || RegWrite !== 0 || ALUControl !== 3'b110)
            $display("Test failed for bne");

        // Test case for j (Jump)
        opcode = 6'b000010; funct = 6'bxxxxxx; #10;  // j opcode
        if (ALUSrc !== 0 || RegDst !== 0 || MemWrite !== 0 || MemRead !== 0 || Beq !== 0 || Bne !== 0 || Jump !== 1 || MemToReg !== 0 || RegWrite !== 0 || ALUControl !== 3'bxxx)
            $display("Test failed for j");

        // End test
        $display("All test cases executed.");
        $finish;
    end

endmodule
