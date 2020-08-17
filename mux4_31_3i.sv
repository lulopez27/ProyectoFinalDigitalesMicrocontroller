module mux4_31_3i(input [1:0] A,
					input[31:0]circ,zero,extsign,
					output logic[31:0] O);
	always@(A or  circ or zero or extsign)
	begin case(A)
		2'b00 :O = circ;//rotcirc
		2'b01 :O = zero;//addzeroes
		2'b10 :O = extsign;//extsign
		default:O =2'b00;
	endcase
	end
endmodule