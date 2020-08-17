module circ_rot(input [24:0] I,
				output [31:0]O);
	logic[31:0] to32;
	assign to32 = {24'H0,I[7:0]};
	logic [31:0] rot1,rot2,rot3,rot4,rot5,rot6,rot7,rot8,rot9,rot10,rot11,rot12,rot13,rot14,rot15;
	circ_rotmod circ_rotmod1(to32,rot1);
	circ_rotmod circ_rotmod2(rot1,rot2);
	circ_rotmod circ_rotmod3(rot2,rot3);
	circ_rotmod circ_rotmod4(rot3,rot4);
	circ_rotmod circ_rotmod5(rot4,rot5);
	circ_rotmod circ_rotmod6(rot5,rot6);
	circ_rotmod circ_rotmod7(rot6,rot7);
	circ_rotmod circ_rotmod8(rot7,rot8);
	circ_rotmod circ_rotmod9(rot8,rot9);
	circ_rotmod circ_rotmod10(rot9,rot10);
	circ_rotmod circ_rotmod11(rot10,rot11);
	circ_rotmod circ_rotmod12(rot11,rot12);
	circ_rotmod circ_rotmod13(rot12,rot13);
	circ_rotmod circ_rotmod14(rot13,rot14);
	circ_rotmod circ_rotmod15(rot14,rot15);
	mux4_31 muxe(I[11:8],to32,rot1,rot2,rot3,rot4,rot5,rot6,rot7,rot8,rot9,rot10,rot11,rot12,rot13,rot14,rot15,O);
endmodule