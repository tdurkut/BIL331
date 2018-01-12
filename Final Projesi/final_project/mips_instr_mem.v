module mips_instr_mem(clock,instruction, program_counter);
input clock;
input [31:0] program_counter;
output [31:0] instruction;

reg [31:0] instr_mem [10:0];

initial begin
	$readmemb("instruction.mem", instr_mem);
end

assign instruction = instr_mem[program_counter];

endmodule