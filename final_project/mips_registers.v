module mips_registers
(
	output wire [31:0] read_data_1, read_data_2,
	input [31:0] write_data, //yazılacak data
	input [4:0] read_reg_1, //okunacak data 1 (rs)
	input [4:0] read_reg_2, //okunacak data 2 (rt)
	input [4:0]	write_reg, //yazılacak register (rd for R types)
	input signal_reg_write, clock
);
	reg [31:0] registers [31:0];
	
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];

	initial 
	begin
	$readmemb("registers.mem", registers);
	end
	
	always @(posedge clock)
	begin 
		if (signal_reg_write) begin
			registers[write_reg] <= write_data;
			//$writememb("res_registers.mem", registers);
		end
	end
	
endmodule