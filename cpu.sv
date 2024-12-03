module cpu(pcClk, clk);
  input pcClk; // slower clock for updating PC
  input clk; // faster clock for internal components

  wire [31:0] PCIn;
  wire [31:0] PCOut;
  ProgramCounter pc(
    .PCIn(PCIn),
    .Clk(pcClk),
    .PCOut(PCOut)
  );

  wire [31:0] instr;
  InstructionMemory im(
    .Address(PCOut),
    .Clk(clk),
    .Instruction(instr)
  );

  wire [31:0] memMuxRes;
  wire ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
  wire [1:0] ALUControl;
  Control control(
    .opcode(instr[31:26]),
    .funct(instr[5:0]),
    .ALUSrc(ALUSrc),
    .RegDst(RegDst),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .Beq(Beq),
    .Bne(Bne),
    .Jump(Jump),
    .MemToReg(RegWrite),
    .ALUControl(ALUControl)
  );

  wire [4:0] writeReg;
  Mux5Bit2To1 regMux(
    .a(instr[20:16]),
    .b(instr[15:11]),
    .op(RegDst),
    .result(writeReg)
  );

  wire [31:0] data1, data2;
  RegisterFile regFile(
    .ReadRegister1(instr[25:21]),
    .ReadRegister2(instr[20:16]),
    .WriteRegister(writeReg),
    .WriteData(memMuxRes),
    .RegWrite(RegWrite),
    .Clk(clk),
    .ReadData1(data1),
    .ReadData2(data2)
  );

  wire [31:0] extendedRes;
  SignExtender signExt(
    .a(instr[15:0]),
    .result(extendedRes)
  );

  wire [31:0] aluB;
  Mux32Bit2To1 aluMux(
    .a(data2),
    .b(extendedRes), // Sign extended instr[15:0]
    .op(ALUSrc),
    .result(aluB)
  );

  wire [31:0] aluRes;
  wire zero;
  ALU32Bit alu(
    .a(data1),
    .b(aluB),
    .op(ALUControl),
    .cin(), // No carry in
    .result(aluRes),
    .cout(),
    .zero(zero)
  );

  wire [31:0] dataMemRes;
  DataMemory dataMem(
    .Address(aluRes),
    .WriteData(data2),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Clk(clk),
    .ReadData(dataMemRes)
  );

  Mux32Bit2To1 memMux(
    .a(aluRes),
    .b(dataMemRes),
    .op(MemToReg),
    .result(memMuxRes)
  );

  // Program counter, Jump, Branch, shenanigans
  wire [31:0] pcPlusFour;
  PCAdder pcAdder(
    .PCIn(PCOut),
    .PCOut(pcPlusFour)
  );
  
  wire [31:0] shiftedWordRes;
  LeftShifterWithDiscard discardShifter(
    .ValueIn(extendedRes),
    .ValueOut(shiftedWordRes)
  );

  wire [31:0] branchAddr;
  BEQAdder beqAdder(
    .ValueIn1(pcPlusFour), // PC + 4
    .ValueIn2(shiftedWordRes),
    .ValueOut(branchAddr)
  );

  wire [31:0] newBranchAddr;
  Mux32Bit2To1 branchMux(
    .a(pcPlusFour), // PC + 4
    .b(branchAddr),
    .op((Bne | Beq) & zero), // Branch and ALU Zero
    .result(newBranchAddr)
  );

  wire [31:0] jumpAddr;
  LeftShifterTwoBits regShifter(
    .ValueIn(instr[25:0]),
    .ValueOut(jumpAddr[27:0])
  );

  assign jumpAddr[31:28] = pcPlusFour[31:28];

  Mux32Bit2To1 newPCAddrMux(
    .a(newBranchAddr),
    .b(jumpAddr),
    .op(Jump),
    .result(PCIn)
  );
endmodule
