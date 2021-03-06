module reg_4bit(input clk,rst,en,
				input [3:0]D,
				output logic [3:0]Q);
	always_ff@(negedge clk or posedge rst)
		if(rst) Q = 4'h0;
		else 
			if(en) Q=D;
endmodule