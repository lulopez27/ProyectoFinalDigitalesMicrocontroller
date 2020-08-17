module ALUMux (input clk,rst,
					input [1:0]sel,
					input[3:0] CMD,
					output logic [3:0] ALUIns);
	always@(negedge clk or posedge rst)
	begin case(sel)
		2'b00 :ALUIns = CMD;//CMD
		2'b01 :ALUIns = 4'b0000;//ADD
		2'b10 :ALUIns = 4'b0000;//ADD
		default:ALUIns =4'b0000;
	endcase
	end
endmodule