module ALU_COND_En(input [3:0] COND,ALUF,
					output logic ENW); //NCZV
	always@(COND  or ALUF)
	begin case(COND)
		4'b0000 : ENW= ALUF[2] ? 1'b1:1'b0;//EQ Z
		4'b0001 : ENW= ALUF[1] ? 1'b0:1'b1;//NE ~Z
		4'b0010 : ENW= ALUF[2] ? 1'b1:1'b0;//CS/HS C	
		4'b0011 : ENW= ALUF[2] ? 1'b0:1'b1;//CC/LO ~C
		4'b0100 : ENW= ALUF[3] ? 1'b1:1'b0;//MI N
		4'b0101 : ENW= ALUF[3] ? 1'b0:1'b1;//PL ~N
		4'b0110 : ENW= ALUF[0] ? 1'b1:1'b0;//VS V
		4'b0111 : ENW= ALUF[0] ? 1'b0:1'b1;//VC ~V
		4'b1000 : ENW= (~ALUF[1]&ALUF[2]) ? 1'b1:1'b0;//HI ~Z&C
		4'b1001 : ENW= (ALUF[1]|~ALUF[2]) ? 1'b1:1'b0;//LS Z|~C
		4'b1010 : ENW= (~(ALUF[3]^ALUF[0])) ? 1'b1:1'b0;//GE ~(N^V)
		4'b1011 : ENW= ((ALUF[3]^ALUF[0])) ? 1'b1:1'b0;//LT (N^V)
		4'b1100 : ENW= (~ALUF[1]&~(ALUF[3]^ALUF[0])) ? 1'b1:1'b0;//GT ~Z&~(N^V)
		4'b1101 : ENW= (ALUF[1]|(ALUF[3]^ALUF[0])) ? 1'b1:1'b0;//LE Z|(N^V)
		4'b1110 : ENW = 1'b1;//Always
		default : ENW = 1'b1;//nothing
	endcase
	end
endmodule