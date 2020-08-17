module AND_N#(parameter N = 4)
				(input [N-1:0] A,B,
					output [N-1:0] Result);				
	assign Result = A&B;
endmodule