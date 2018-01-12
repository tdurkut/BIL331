module mips_control_unit(opcode, func, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite );
input [5:0] opcode;
input [5:0] func;
output reg RegDst;
output reg Branch;
output reg MemRead;
output reg MemtoReg;
output reg [3:0] ALUOp;
output reg MemWrite;
output reg ALUSrc;
output reg RegWrite;

// function codes for R types
`define ADD  6'b100000
`define ADDU 6'b100001
`define SUB  6'b100010
`define SUBU 6'b100011
`define AND  6'b100100
`define OR   6'b100101
`define SRA  6'b000011
`define SRL  6'b000010
`define SLL  6'b000000
`define SLT  6'b101010
`define SLTU 6'b101011
`define JR   6'b001000
`define NOR  6'b100111


// opcodes 
`define ADDI 6'b001000
`define BEQ  6'b000100
`define BNE  6'b000101
`define LW   6'b100011
`define SW   6'b101011
`define SLTI 6'b001010 
`define ORI  6'b001101
`define XORI 6'b001110


always@(*) begin
	RegDst = 0;
	Branch = 0;
	MemRead = 0;
	MemtoReg = 0;
	MemWrite = 0;
	ALUSrc = 0;
	RegWrite = 0;
	ALUOp = 4'b0;
if(opcode == 6'b000000) 
begin
	RegDst = 1;
	Branch = 0;
	MemRead = 0;
	MemtoReg = 0;
	MemWrite = 0;
	ALUSrc = 0;
	RegWrite = 1;
	case(func)
		`ADD:
		begin 
			ALUOp = 4'd1; //toplama islemi
		end
		
		`ADDU:
		begin
			ALUOp = 4'd11; //toplama islemi unsigned
		end
		
		`AND:
		begin
			ALUOp = 4'd2; //and islemi
		end
		
		`JR:
		begin
			ALUOp = 4'd0; // no operation
		end
		
		`NOR:
		begin
			ALUOp = 4'd3; // nor islemi
		end
		
		`OR:
		begin
			ALUOp = 4'd4; // or islemi
		end
		
		`SLT:
		begin
			ALUOp = 4'd5; // slt 
		end
		
		`SLTU:
		begin 
			ALUOp = 4'd10; // sltu
		end
		
		`SLL:
		begin 
			ALUOp = 4'd6; // shift left logical
		end
		
		`SRL:
		begin
			ALUOp = 4'd7; // shift right logical
		end
		
		`SUB:
		begin 
			ALUOp = 4'd9; // cikarma signed
		end
		
		`SUBU:
		begin 
			ALUOp = 4'd8; // cikarma islemi unsigned
		end
	endcase
end
else if(opcode == `LW)
begin
	RegDst = 0;
	ALUSrc = 1;
	MemtoReg = 1;
	RegWrite = 1;
	MemRead = 1;
	MemWrite = 0;
	Branch = 0;
	ALUOp = 4'd1; //toplama yap
end
else if(opcode == `SW)
begin 
	RegDst = 1'bx;
	ALUSrc = 1;
	MemtoReg = 1'bx;
	RegWrite = 0;
	MemRead = 0;
	MemWrite = 1;
	Branch = 0;
	ALUOp = 4'd1; //toplama yap
end

else if(opcode == `BEQ)
begin 
	RegDst = 1'bx;
	ALUSrc = 0;
	MemtoReg = 1'bx;
	RegWrite = 0;
	MemRead = 0;
	MemWrite = 0;
	Branch = 1;
	ALUOp = 4'd12; 
end
else if(opcode == `BNE)
begin 
	RegDst = 1'bx;
	ALUSrc = 0;
	MemtoReg = 1'bx;
	RegWrite = 0;
	MemRead = 0;
	MemWrite = 0;
	Branch = 1;
	ALUOp = 4'd13; 
end
else if(opcode == `ADDI)
	RegDst = 1'b0;
	ALUSrc = 1;
	MemtoReg = 0;
	RegWrite = 1;
	MemRead = 0;
	MemWrite = 0;
	Branch = 0;
	ALUOp = 4'd1;
end

endmodule