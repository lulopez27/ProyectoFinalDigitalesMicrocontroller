module LSR_LSL_N #(parameter N = 8)
				(input [N-1:0] A,input Dir, //Dir indicates direction 1 for right 0 for left
					output [N-1:0] S);
	assign S[0] = Dir&A[1];
	genvar i;
	generate
		for(i = 1;i<N-1;i++)
		begin: generate_shifter
			assign S[i] = Dir&A[i+1]|~Dir&A[i-1];
		end
	endgenerate
assign S[N-1] = ~Dir&A[N-2];
endmodule