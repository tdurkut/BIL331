module mips_registers_testbench();

wire [31:0] read_data_1, read_data_2;
reg [31:0] write_data;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg signal_reg_write, clk;


always begin
write_data = 32'b11100000000000011100000000000000;
read_reg_1 = 5'b01110;
read_reg_2 = 5'b01010;
write_reg = 5'b00010;
signal_reg_write = 1'b0;
clk = 1'b0;
#20;
end

mips_registers foo (read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);


initial
begin
$monitor("time = %2d, read_data_1= %32b  read_data_2= %32b", $time, read_data_1, read_data_2);
end
endmodule