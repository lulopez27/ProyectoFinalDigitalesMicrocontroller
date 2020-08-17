module Flags #(parameter N = 4)
			(input A_Sign, input B_Sign,input [3:0] ALUControl,input [N-1:0] ALUResult, 
			 output [1:0] ALUFlags);//ZV
	//ADDORSUB
	logic ADDorSUB;
	assign ADDorSUB = (~ALUControl[3]&~ALUControl[2]&~ALUControl[1]); //Represents ADD or SUB operation
	//FLAGS
	assign ALUFlags[0] = ~|ALUResult;//Zero
	assign ALUFlags[1] = ADDorSUB&(A_Sign^ALUResult[N-1])&((~(A_Sign^B_Sign)&~ALUControl[0])|((A_Sign^B_Sign)&ALUControl[0])); //oVerflow
endmodule 