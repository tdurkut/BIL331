module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output reg [31:0] read_data_1, read_data_2;
	input wire [31:0] write_data;
	input wire [4:0] read_reg_1, read_reg_2, write_reg;
	input wire signal_reg_write, clk;
	integer rs_index;
	integer rt_index;
	integer rd_index;
	reg [31:0] registers [31:0];
	

	always @(*) begin
		$readmemb("registers.mem",registers); 
		rs_index = read_reg_1;
		rt_index = read_reg_2;
		rd_index = write_reg;
		read_data_1 = registers[rs_index];
		read_data_2 = registers[rt_index];
		if(signal_reg_write == 1'b1)
		begin
			registers[rd_index] = write_data;
			$writememb("registers.mem",registers);
		end
	end

		


endmodule