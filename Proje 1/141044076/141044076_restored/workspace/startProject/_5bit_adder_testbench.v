`define DELAY 20
module _5bit_adder_testbench(); 
reg[4:0] a, b;
reg carry_in;
wire[4:0] sum;
wire carry_out;

_5bit_adder fatb (sum, carry_out, a, b, carry_in);

initial begin
a = 5'b11100; b = 5'b00011; carry_in = 1'b0;
#`DELAY;
a = 5'b10101; b = 5'b01010; carry_in = 1'b0;
#`DELAY;
a = 5'b00010; b = 5'b11010; carry_in = 1'b0;
end
 
 
initial
begin
$monitor("time = %2d, a =%5b, b=%5b, carry_in=%1b, sum=%5b, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
end
 
endmodule