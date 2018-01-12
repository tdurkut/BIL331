module mips_data_mem (clock, read_data, mem_address, write_data, sig_mem_read, sig_mem_write);
input clock;
output [31:0] read_data;
input [31:0] mem_address;
input [31:0] write_data;
input sig_mem_read;
input sig_mem_write;

reg [31:0] data_mem  [63:0];
reg [31:0] read_data;

initial begin
	$readmemb("data.mem", data_mem);
end

always @(posedge clock) begin
	if (sig_mem_read) begin
		read_data <= data_mem[mem_address];
	end
	
	if (sig_mem_write) begin
		data_mem[mem_address] <= write_data[31:0];
	end
end

endmodule