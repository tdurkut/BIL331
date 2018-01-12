`define DELAY 20
module digitalCircuit_testbench(); 
reg[4:0] a, b;
reg[1:0] select;
wire[4:0] result;

digitalCircuit fooA(result, a, b, select);

initial begin
a = 5'b01010; b = 5'b10101; select = 2'b00;
#`DELAY;
a = 5'b00101; b = 5'b11110; select = 2'b01;
#`DELAY;
a = 5'b01011; b = 5'b10100; select = 2'b10;
#`DELAY;
a = 5'b01001; b = 5'b01010; select = 2'b11;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, a =%5b, b=%5b, select = %2b, result=%5b", $time, a, b, select, result);
end
 
endmodule