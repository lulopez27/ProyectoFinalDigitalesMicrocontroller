module mux4_31(input [3:0] A,
					input[31:0]R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,
					output logic[31:0] R);
	always@(A or R0 or R1 or R2 or R3 or R4 or R5 or R6 or R7 or R8 or R9 or 
	R10 or R11 or R12 or R13 or R14 or R15)
	begin case(A)
		4'd0 :R = R0;//R0
		4'd1 :R = R1;//R1
		4'd2 :R = R2;//R2
		4'd3 :R = R3;//R3
		4'd4 :R = R4;//R4
		4'd5 :R = R5;//R5
		4'd6 :R = R6;//R6
		4'd7 :R = R7;//R7
		4'd8 :R = R8;//R8
		4'd9 :R = R9;//R9
		4'd10 :R =R10;//R10
		4'd11 :R =R11;//R11
		4'd12 :R =R12;//R12
		4'd13 :R =R13;//R13
		4'd14 :R =R14;//R14
		4'd15 :R =R15;//R15
		default:R =R0;
	endcase
	end
endmodule