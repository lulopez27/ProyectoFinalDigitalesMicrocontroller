module ControlUnit(input clk,rst,
						input[3:0] Cond, //condicional
						input [1:0]OP,
						input [5:0]Funct, //IPUBWL
						input [3:0]ALUFlags,
						output logic PCsrc,
						output logic MemtoReg,
						output logic MemWrite,
						output [3:0]ALUControl,
						output ALUSrc,
						output [1:0]ImmSrc,
						output RegWrite,
						output [1:0]RegSrc);
	logic [3:0]lastFlgs,ALUIns;
	logic EnW,EnF;
	assign EnF = Funct[0]&~OP[1]&~OP[0];
	assign MemtoReg = ~OP[1]&OP[0]&Funct[0];//When there is a LDR instruction, it is loaded from DataMem
	assign MemWrite = ~OP[1]&OP[0]&~Funct[0];
	deco4_4 ALUdeco(Funct[4:1],ALUIns);
	FlagControl FlagReg(clk,rst,EnF,ALUFlags,lastFlgs);
	ALUMux ALUSel(clk,rst,OP,ALUIns,ALUControl);
	ALU_COND_En eval(Cond,lastFlgs,EnW);
	assign PCsrc = (OP[1]&~OP[0]&EnW);
	assign ALUSrc = ~(~OP[1]&~OP[0]&~Funct[5]);
	assign ImmSrc = OP;
	assign RegWrite = (~OP[0]&~OP[1])|(OP[0]&~OP[1]&Funct[0]);//(~OP[0]&~OP[1]&EnW)|((~OP[0])&OP[1]&Funct[0]);
	assign RegSrc[1] = OP[1]&~OP[0];
	assign RegSrc[0] = ~OP[1]&OP[0];
endmodule