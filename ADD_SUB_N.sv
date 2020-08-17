module ADD_SUB_N#(parameter N = 4)
				(input [N-1:0] A, input [N-1:0] B,input Cin,
					output [N-1:0] S, output Cout);
	logic[N-2:0] C;
	full1BitAdder firstAdd(A[0],B[0],Cin,S[0],C[0]);
	genvar i;
	generate
		for(i = 1;i<N-1;i++)
		begin: generate_FF
			full1BitAdder adder(A[i],B[i],C[i-1],S[i],C[i]);
		end
	endgenerate
	full1BitAdder lastAdd(A[N-1],B[N-1],C[N-2],S[N-1],Cout);
endmodule