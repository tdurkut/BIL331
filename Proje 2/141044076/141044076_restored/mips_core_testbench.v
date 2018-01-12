`define DELAY 20
module mips_core_testbench();

reg [31:0] instruction_set;
wire [31:0]result;
mips_core foo (result,instruction_set);
initial begin
instruction_set = 32'b00000011111000011111000000100000; //add
#`DELAY;
instruction_set = 32'b00000000010000100101000000100001; //addu
#`DELAY;
instruction_set = 32'b00000011111000011110100000100010; //sub
#`DELAY;
instruction_set = 32'b00000010000010001100100000100100; //and
#`DELAY;
instruction_set = 32'b00000010000010001110000000100101; //or
#`DELAY;
instruction_set = 32'b00000000000111111100000011000011; //sra 
#`DELAY;
instruction_set = 32'b00000000000111111011100011000010; //srl
#`DELAY;
instruction_set = 32'b00000000000111111011000011000000; //sll
#`DELAY;
instruction_set = 32'b00000000001111111010100000101011; //sltu
#`DELAY;

$finish;
end

initial begin
$monitor("time: %2d instruction: %b result: %d\n",$time,instruction_set,result);
end


endmodule