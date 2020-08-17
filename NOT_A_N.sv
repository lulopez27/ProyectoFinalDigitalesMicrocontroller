module NOT_A_N#(parameter N = 4)
				(input [N-1:0] A,
					output [N-1:0] Result);				
	assign Result = ~A;
endmodule