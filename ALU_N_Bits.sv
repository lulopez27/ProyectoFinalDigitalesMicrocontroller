module ALU_N_Bits #(parameter N = 4)
		(input [N-1:0] A, input [N-1:0] B,input [3:0] ALUControl, 
			output [N-1:0] ALUResult, output [3:0] ALUFlags);//VZCN
	//Used logic
	logic Cout;//Carry out for ADDSUB
	logic [N-1:0] complement_B;//Stands for either B complemented or not, depending on ALUControl[0]
	logic [N-1:0] ADD_SUB_R,AND_R,OR_R,NOT_R,XOR_R,LSL_LSR_R,ASL_ASR_R;//the results to the Operations
	logic [N-1:0] complement_En;//Enables the complement of B for substraction
	//generate Complement_En
	genvar i;
	generate
		for(i = 0;i<N;i++)
		begin: connectALUControl
			assign complement_En[i] = ALUControl[0];
		end
	endgenerate
	//OPERATIONS
	XOR_N #(N) XOR_B(B,complement_En,complement_B); //Used for complement
	ADD_SUB_N #(N) ADD_SUB (A,complement_B,ALUControl[0],ADD_SUB_R,Cout); //0000 ADD 0001 SUB
	circ_rot_ALU circr(A,B,AND_R); //0010 AND --Circrot
	OR_N #(N) OR(A,B,OR_R); //0011 OR
	NOT_N #(N) NOT(A,NOT_R); //0100 NOT
	XOR_N #(N) XOR(A,B,XOR_R);//0101 XOR
	LSR_LSL_N #(N) LSR_LSL(A,ALUControl[0],LSL_LSR_R); //0110 Left 0111 Right
	ASR_ASL_N #(N) ASR_ASL(A,ALUControl[0],ASL_ASR_R); //1000 Left 1001 Right
	//RESULT MUX
	MUX_4_N #(N) controlMux(ALUControl,ADD_SUB_R,ADD_SUB_R,AND_R,OR_R,
	NOT_R,XOR_R,LSL_LSR_R,LSL_LSR_R,ASL_ASR_R,ASL_ASR_R,ALUResult);
	assign ALUFlags[0] = ALUResult[N-1];
	assign ALUFlags[1] = Cout;
	Flags #(N) Flag_Mod(A[N-1],B[N-1],ALUControl,ALUResult,ALUFlags[3:2]);//ZV
endmodule