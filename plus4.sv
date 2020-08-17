module plus4(input[12:0] PC,
						output logic[12:0] PC4);
	assign PC4 = PC + 13'h4;
endmodule