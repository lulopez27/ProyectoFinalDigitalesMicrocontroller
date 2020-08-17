module NOT_N#(parameter N = 4)(input [N-1:0]B,
					output [N-1:0]S);
	assign S = ~B;
endmodule