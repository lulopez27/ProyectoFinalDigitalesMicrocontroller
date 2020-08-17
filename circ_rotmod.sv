module circ_rotmod#(parameter N = 32)(input [N-1:0]I,
					output [N-1:0]O);
	assign O[N-1] =  I[0];
	assign O[N-2:0] = I[N-1:1];
endmodule