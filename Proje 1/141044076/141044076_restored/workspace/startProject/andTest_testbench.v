`define DELAY 20
module andTest_testbench(); 
reg[4:0] a, b;
wire[4:0] result;

andTest foo(result,a, b);

initial begin
a = 5'b01010; b = 5'b10101;
#`DELAY;
a = 5'b00101; b = 5'b11110;
#`DELAY;
a = 5'b01011; b = 5'b10100;
#`DELAY;
a = 5'b01001; b = 5'b01010;
end
 
 
initial
begin
$monitor("time = %2d, a =%5b, b=%5b, result=%5b", $time, a, b, result);
end
 
endmodule