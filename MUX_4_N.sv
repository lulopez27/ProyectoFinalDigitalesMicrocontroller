module MUX_4_N #(parameter N = 4)
				(input [3:0]S, input [N-1:0] ADD,SUB,AND,OR,NOT,XOR,LSL,LSR,ASL,ASR,
					output [N-1:0] Result);
	logic[9:0]entries; //Splits the entries to each Mux
	genvar i;
	generate
		for(i = 0;i<N;i++)
		begin: generate_MUX
			MUX_4_1 Muxes(S,ADD[i],SUB[i],AND[i],OR[i],NOT[i], XOR[i], LSL[i],LSR[i], ASL[i],ASR[i],Result[i]);
		end
	endgenerate
endmodule