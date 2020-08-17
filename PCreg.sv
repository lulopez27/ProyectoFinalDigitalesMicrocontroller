module PCreg#(N=10)
	(input clk,rst,
	input [N-1:0] PCin,
	output logic [N-1:0] PCout);
	always@(posedge clk or posedge rst)
	if(rst) PCout = 13'h1FFC;
	else PCout=PCin;
endmodule