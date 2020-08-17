module reg_32bit(input clk,rst,en,
				input [31:0]D,
				output logic [31:0]Q);
	always_ff@(posedge clk or posedge rst)
		if(rst) Q = 32'h00;
		else 
			if(en) Q=D;
endmodule