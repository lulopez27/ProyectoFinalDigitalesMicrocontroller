module SUM_SUB_4_TB();
	logic signed  [3:0] A,B,S;
	logic signed  [2:0] C;
	logic Cin,Cout;
	full1BitAdder firstAdd(A[0],B[0],Cin,S[0],C[0]);
	full1BitAdder Sec_ADD(A[1],B[1],C[0],S[1],C[1]);
	full1BitAdder Third_ADD(A[2],B[2],C[1],S[2],C[2]);
	full1BitAdder lastAdd(A[3],B[3],C[2],S[3],Cout);
	initial
	begin
	A = 4'b0000;
	B = 4'b0000;
	Cin = 1'b0;
	#5
	A = 4'b0001;
	B = 4'b0001;
	Cin = 1'b0;
	#5
	A = 4'b0010;
	B = 4'b0010;
	Cin = 1'b0;
	end
endmodule