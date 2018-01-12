module mips_core(clock,instruction,ALUResult,read_data_1,read_data_2, write_reg, RegWrite);
input clock;
output [31:0] instruction;
output [31:0] read_data_1, read_data_2;
output [31:0] ALUResult;
output [4:0] write_reg;
output RegWrite;

wire [31:0] read_data_memory;
wire [31:0] instruction;
wire [5:0] opcode, func;
wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, signal_zero;
wire [3:0] ALUOp;
wire [31:0] write_data,read_data_1,read_data_2;
wire [4:0] write_reg, read_reg_1, read_reg_2, shamt;
wire [31:0] ALUResult;

assign func = instruction[5:0];
assign opcode = instruction[31:26];
assign write_reg = instruction[15:11];//rd
assign  read_reg_2 = instruction[20:16]; //rt
assign  read_reg_1 = instruction[25:21];  //rs
assign shamt = instruction[10:6];
assign imm = instruction[15:0];
reg[31:0] PC = 32'b0;

mips_control_unit cunit(opcode, func, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite );
mips_instr_mem instructionmem(clock,instruction, PC);
mips_registers registers(read_data_1,read_data_2,ALUResult,read_reg_1,read_reg_2,write_reg,RegWrite,clock);
mips_alu alu(ALUOp, read_data_1, read_data_2, ALUResult, signal_zero);
mips_data_mem datamem(clock, read_data_memory, ALUResult, write_data, MemRead, MemWrite);
always @(posedge clock)
begin 
PC = PC+1;
end 



endmodule