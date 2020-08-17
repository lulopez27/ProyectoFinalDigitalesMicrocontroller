module chipSelect(input Address,
						input [31:0] RAM,
						input [31:0] ROM,
						output logic [31:0] ReadData);
always@(Address or RAM or ROM)
	begin case(Address)
		1'b0 : ReadData = RAM;//CMD
		1'b1 : ReadData = ROM;//ADD
		default:ReadData=12'b0 ;
	endcase
	end
endmodule