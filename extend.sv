module extend(input [23:0] I,input[1:0]ImmSrc,
					output logic [31:0] ExtImm);
	logic [31:0]cir,z,extsign,Ix4;
	assign z[31:12] = 20'b0;
	assign z[11:0] = I[11:0];
	assign Ix4 = I<<2;
	assign extsign	= {{8{I[23]}},Ix4[23:00]};
	circ_rot circrot(I,cir);
	mux4_31_3i selE(ImmSrc,cir,z,extsign,ExtImm);
endmodule