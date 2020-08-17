module FlagControl(input clk,rst,FlagEn,
						input [3:0] Flags,
						output [3:0] condFlags);
	reg_4bit FlagReg(~clk,rst,FlagEn,Flags,condFlags);
endmodule