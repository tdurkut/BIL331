`define ADD  6'b100000
`define ADDU 6'b100001
`define SUB  6'b100010
`define AND  6'b100100
`define OR   6'b100101
`define SRA  6'b000011
`define SRL  6'b000010
`define SLL  6'b000000
`define SLTU 6'b101011

module mips_core(result,instruction);

input [31:0] instruction;
output [31:0] result;
reg [31:0] result;
wire [31:0] rs_content;
wire [31:0] rt_content;
reg [4:0] rs, rt, rd, shamt;
reg [5:0] opcode, func;
reg clk,signal_reg_write;
reg [31:0] write_data;

initial begin
signal_reg_write = 0;
clk = 0;
end


always @(instruction) begin 
opcode = instruction[31:26];
rs = instruction[25:21];
rt = instruction[20:16];
rd = instruction[15:11];
shamt = instruction[10:6];
func = instruction[5:0];
if(opcode != 6'b000000) 
begin
	$display("Unsupported type of instruction\n");
end
end

mips_registers foo (rs_content, rt_content,write_data, rs, rt,rd,signal_reg_write,clk);

always @(func or result or rs_content or rt_content) begin 
	if (func == `ADD) begin
	result = $signed(rs_content) + $signed(rt_content);
	end
	else if (func == `ADDU) begin
	result = rs_content + rt_content;
	end
	else if (func == `SUB) begin
	result = $signed(rs_content) - $signed(rt_content);
	end
	else if (func == `AND) begin
	result = rs_content & rt_content;
	end
	else if (func == `OR) begin
	result = rs_content | rt_content;
	end
	else if (func == `SRA) begin
	result = rt_content >>> shamt;
	end
	else if (func == `SRL) begin
	result = rt_content >> shamt;
	end
	else if (func == `SLL) begin
	result = rt_content << shamt;
	end 
	else if (func == `SLTU) begin
	result = (rs_content < rt_content) ? 1 : 0;
	end
	else begin
	$display("Unsupported instruction\n");
	end
	write_data = result;
	signal_reg_write = 1;
	clk = 1;
end



endmodule