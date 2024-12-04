module Control (opcode, funct, ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl);
    input [5:0] opcode;
    input [5:0] funct;
    output reg ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
    output reg [2:0] ALUControl;

    reg [1:0] ALUOp;

    always @(*) begin
        // Default control signals
        ALUSrc = 0;
        ALUOp = 2'b00;
        RegDst = 0;
        MemWrite = 0;
        MemRead = 0;
        Beq = 0;
        Bne = 0;
        Jump = 0;
        MemToReg = 0;
        RegWrite = 0;

        case (opcode)
            // R-type (add, sub)
            6'b000000: begin
                RegDst = 1;
                ALUOp = 2'b10;
                RegWrite = 1;
            end
            // ADDI
            6'b001000: begin
                ALUSrc = 1;
                ALUOp = 2'b10;
                RegWrite = 1;
            end
            // STORE WORD
            6'b101011: begin
                ALUSrc = 1;
                MemWrite = 1;
            end
            // LOAD WORD
            6'b100011: begin
                ALUSrc = 1;
                MemRead = 1;
                MemToReg = 1;
                RegWrite = 1;
            end
            // BRANCH EQUAL
            6'b000100: begin
                ALUOp = 2'b01;
                Beq = 1;
            end
            // BRANCH NOT EQUAL
            6'b000101: begin
                ALUOp = 2'b01;
                Bne = 1;
            end
            // JUMP
            6'b000010: begin
                ALUOp = 2'bxx;
                Jump = 1;
            end
            default: begin
                // Unsupported opcodes
            end
        endcase

      case (ALUOp)
        2'b00: ALUControl = 3'b010; // Load/Store
        2'b01: ALUControl = 3'b110; // Branch
        2'b10: begin
           case (funct)
             6'b100000: ALUControl = 3'b010; // add
             6'b100010: ALUControl = 3'b110; // sub
             6'b100100: ALUControl = 3'b000; // and
             6'b100101: ALUControl = 3'b001; // or
             6'b101010: ALUControl = 3'b111; // set on less than (slt)
             default:   ALUControl = 3'bxxx; // undefined operation
           endcase
        end
        default: ALUControl = 3'bxxx; // undefined ALUOp
      endcase
    end
endmodule
