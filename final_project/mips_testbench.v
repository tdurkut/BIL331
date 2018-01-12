module mips_testbench ();
reg clock;
wire [31:0] result;
wire [31:0] read_data_1, read_data_2;
wire [4:0] read_reg_1, read_reg_2;
wire [4:0] write_reg;
wire [5:0] opcode, func;

wire RegWrite;
wire   [31:0] instruction;
assign func = instruction[5:0];
assign opcode = instruction[31:26];
assign write_reg = instruction[15:11];//rd
assign read_reg_1 = instruction[25:21];  //rs
assign read_reg_2 = instruction[20:16]; //rt
assign shamt = instruction[10:6];

mips_core test(clock,instruction,result, read_data_1, read_data_2, write_reg, RegWrite);

initial clock = 0;

initial begin
	#50 clock = ~clock; //ins
	#50 clock = ~clock; 
	
	#50 clock = ~clock; //ins
	#50 clock = ~clock;
	
	#50 clock = ~clock; //ins
	#50 clock = ~clock;
	
	#50 clock = ~clock; //ins
	#50 clock = ~clock;
	
	#50 clock = ~clock; //ins
	#50 clock = ~clock;
	
	#50 clock = ~clock; //ins
	#50 clock = ~clock;
	
	#50 clock = ~clock; //ins
	#50 clock = ~clock;
end
//End of the test stage, you have to save register & data contents 
//to res_registers.mem , res_data.mem (create new files)
initial begin
$monitor("=====================================================================\n time: %2d instruction: %b result: %d\n RS: %5b RT: %5b RD: %5b Read_data_1: %32b, Read_data_2: %32b,  RegWrite signal: %b, RD adress: %5b",$time,instruction,result,read_reg_1,read_reg_2,write_reg,read_data_1,read_data_2, RegWrite, write_reg);
end

initial begin
	#3000
	$writememb("res_registers.mem", test.registers.registers);
	//$writememb("res_data.mem", test.mips_data_mem.data_mem);
end
endmodule