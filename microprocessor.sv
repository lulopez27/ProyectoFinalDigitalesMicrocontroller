module microprocessor(input clk,rst);
	logic[31:0] Instr,ALUResult,RD1,RD2,ExtImm,Result,ReadData,SrcB,RAMex,ROMex;
	logic [12:0]nextPC,currPC,PC4,PC8;
	logic[3:0]ALUControl,ALUFlags,A1,A2;
	logic [1:0]RegSrc,ImmSrc;
	logic MemToReg,MemWrite,ALUSrc,RegWrite,PCSrc;
	insmem instrmemory({19'h0,currPC},Instr);
	reg_file regfile(clk,rst,A1,A2,Instr[15:12],Result,PC8,RegWrite,RD1,RD2);
	ALU_N_Bits#(32) ALU32(RD1,SrcB,ALUControl,ALUResult,ALUFlags);
	extend extnd(Instr[23:0],ImmSrc,ExtImm);
	dataMemory dataMem(ALUResult[7:0],~clk,RD2,MemWrite,RAMex);
	//messageTest message({1'b0,ALUResult[6:0]},~clk,ROMex);
	//notmssg message({1'b0,ALUResult[6:0]},~clk,ROMex);
	//xormssg message({1'b0,ALUResult[6:0]},~clk,ROMex);
	circmssg message({1'b0,ALUResult[6:0]},~clk,ROMex);
	PCreg#(13) PC_reg(clk,rst,nextPC,currPC);
	plus4 PCp4 (currPC,PC4);
	plus4 PCp8 (PC4,PC8);
	mux2_1#(13) PCSrcMux(PCSrc,PC4,Result[12:0],nextPC);
	mux2_1#(32) MemToRegMux(MemToReg,ALUResult,ReadData,Result);
	mux2_1#(4) RegSrcMux0(RegSrc[0],Instr[3:0],Instr[15:12],A2);
	mux2_1#(32) ALUSrcMux(ALUSrc,RD2,ExtImm,SrcB);
	mux2_1#(4) RegSrcMux1(RegSrc[1],Instr[19:16],4'd15,A1);
	chipSelect ChipSel(ALUResult[7],RAMex,ROMex,ReadData);
	ControlUnit ctrlunit(clk,rst,Instr[31:28],Instr[27:26],Instr[25:20],ALUFlags,
		PCSrc,MemToReg,MemWrite,ALUControl,ALUSrc,ImmSrc,RegWrite,RegSrc);
endmodule