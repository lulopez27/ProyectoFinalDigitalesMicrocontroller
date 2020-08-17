module MUX_4_1(input[3:0] S, input ADD,SUB,AND,OR,NOT,XOR,LSL,LSR,ASL,ASR,
			output Result);
	logic[9:0]R;
	assign R[0] = ~S[0]&~S[1]&~S[2]&~S[3]&ADD;//ADD
	assign R[1] = S[0]&~S[1]&~S[2]&~S[3]&SUB;//SUB
	assign R[2] = ~S[0]&S[1]&~S[2]&~S[3]&AND;//AND
	assign R[3] = S[0]&S[1]&~S[2]&~S[3]&OR;//OR
	assign R[4] = ~S[0]&~S[1]&S[2]&~S[3]&NOT;//NOT
	assign R[5] = S[0]&~S[1]&S[2]&~S[3]&XOR;//XOR
	assign R[6] = ~S[0]&S[1]&S[2]&~S[3]&LSL;//LSL
	assign R[7] = S[0]&S[1]&S[2]&~S[3]&LSR;//LSR
	assign R[8] = ~S[0]&~S[1]&~S[2]&S[3]&ASL;//ASL
	assign R[9] = S[0]&~S[1]&~S[2]&S[3]&ASR;//ASR	
	assign Result = |R;
endmodule