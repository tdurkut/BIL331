module mips_alu(ALUOp, content1, content2, result, signal_zero);
input [3:0] ALUOp;
input [31:0] content1, content2;
output reg [31:0] result;
output reg signal_zero; // for branch

reg [3:0] op_add = 4'd1;
reg [3:0] op_addu = 4'd11;
reg [3:0] op_and = 4'd2;
reg [3:0] op_jr = 4'd0;
reg [3:0] op_nor = 4'd3;
reg [3:0] op_or = 4'd4;
reg [3:0] op_slt = 4'd5;
reg [3:0] op_sltu = 4'd10;
reg [3:0] op_sll = 4'd6;
reg [3:0] op_srl = 4'd7;
reg [3:0] op_sub = 4'd9;
reg [3:0] op_subu = 4'd8;
reg [3:0] op_beq = 4'd12;
reg [3:0] op_bne = 4'd13;

always@(content1 or content2 or ALUOp)
begin
result = 0;
signal_zero = 0;
	case(ALUOp)
	op_add:
		begin
			result = $signed(content1)+ $signed(content2);
		end
	op_addu:
		begin
			result = content1 + content2;
		end
	op_and:
		begin
			result = content1 & content2;
		end
	op_nor:
		begin
			result = ~(content1 | content2);
		end
	op_or:
		begin 
			result = content1 | content2;
		end
	op_slt:
		begin
			result = ($signed(content1) < $signed(content2)) ? 1 : 0;
		end
	op_sltu:
		begin 
			result = (content1 < content2) ? 1 : 0;
		end
	op_sll:
		begin
			result = content1 << content2;
		end
	op_srl:
		begin
			result = content1 >> content2;
		end
	op_sub:
		begin
			result = $signed(content1) - $signed(content2);
			
		end
	op_subu:
		begin
			result = content1 - content2;
		end
	op_beq:
		begin
			result = $signed(content1) - $signed(content2);
			signal_zero = (result == 0) ? 1 : 0;
		end
	op_bne:
		begin
			result = $signed(content1) - $signed(content2);
			signal_zero = (result != 0) ? 1 : 0;
		end
	endcase
end


endmodule