module reg_file(input clk,rst,
					input [3:0] A1,A2,A3,
					input [31:0] WD3,
					input [12:0]R15,
					input WE3,
					output [31:0] RD1, RD2);
	logic [31:0]R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,Ro15;
	logic [15:0] WE;
	assign Ro15= {19'h0,R15};
	deco4_16 deco0(A3,WE);
	mux4_31 muxA1(A1,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,Ro15,RD1);
	mux4_31 muxA3(A2,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,Ro15,RD2);
	reg_32bit reg0(clk, rst,WE[0]&WE3,WD3,R0);//0
	reg_32bit reg1(clk, rst,WE[1]&WE3,WD3,R1);//1
	reg_32bit reg2(clk, rst,WE[2]&WE3,WD3,R2);//2
	reg_32bit reg3(clk, rst,WE[3]&WE3,WD3,R3);//3
	reg_32bit reg4(clk, rst,WE[4]&WE3,WD3,R4);//4
	reg_32bit reg5(clk, rst,WE[5]&WE3,WD3,R5);//5
	reg_32bit reg6(clk, rst,WE[6]&WE3,WD3,R6);//6
	reg_32bit reg7(clk, rst,WE[7]&WE3,WD3,R7);//7
	reg_32bit reg8(clk, rst,WE[8]&WE3,WD3,R8);//8
	reg_32bit reg9(clk, rst,WE[9]&WE3,WD3,R9);//9
	reg_32bit reg10(clk,rst,WE[10]&WE3,WD3,R10);//10
	reg_32bit reg11(clk,rst,WE[11]&WE3,WD3,R11);//11
	reg_32bit reg12(clk,rst,WE[12]&WE3,WD3,R12);//12
	reg_32bit reg13(clk,rst,WE[13]&WE3,WD3,R13);//13
	reg_32bit reg14(clk,rst,WE[14]&WE3,WD3,R14);//14
endmodule