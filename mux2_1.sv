module mux2_1#(parameter N = 32) (input sel,
					input[N-1:0] a,b,
					output logic[N-1:0] o);
	always@(sel or a or b)
	if(sel == 1'b1)  o=b;
	else  o=a;
endmodule 