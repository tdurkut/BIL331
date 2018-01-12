module im_tb();
wire [31:0] instruction;
reg [31:0] prog_counter;
reg clk; 
integer i;
mips_instr_mem foo(clk,instruction, prog_counter);

always begin
		clk <= ~clk;
		#5;
	end

	initial begin
		$monitor("time = %2d, instruction= %32b  prog_counter= %32b", $time, instruction, prog_counter);
		clk <= 1'b0;
		i <= 1'b0;
		prog_counter <= 32'd0;

		@(posedge clk);
		i <= i +1;
		prog_counter <= prog_counter+1;
		@(posedge clk);
		prog_counter <= prog_counter+1;
		i <= i +1;
		@(posedge clk);
		prog_counter <= prog_counter+1;
		i <= i +1;
		@(posedge clk);
		prog_counter <= prog_counter+1;
		i <= i +1;
		@(posedge clk);
		prog_counter <= prog_counter+1;
		i <= i +1;
		$finish;
	end

endmodule