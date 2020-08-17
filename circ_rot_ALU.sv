module circ_rot_ALU(input [31:0]A, input [31:0]B,
				    output logic [31:0]O);
always @(A or B)
begin
	if (B == 31'h0)
		O = A;
	else if (B == 31'h1)
	begin
		O[31:8] = A[31:8];
		O[7:0] = {A[0], A[7:1]};
	end
	else if (B == 31'h2)
		begin
		O[31:8] = A[31:8];
		O[7:0] = {A[1:0], A[7:2]};
	end
	else if (B == 31'h3)
		begin
		O[31:8] = A[31:8];
		O[7:0] = {A[2:0], A[7:3]};
	end
	else if (B == 31'h4)
	begin
		O[31:8] = A[31:8];
		O[7:0] = {A[3:0], A[7:4]};
	end
	else if (B == 31'h5)
		begin
		O[31:8] = A[31:8];
		O[7:0] = {A[4:0], A[7:5]};
	end
	else if (B == 31'h6)
	begin
		O[31:8] = A[31:8];
		O[7:0] = {A[5:0], A[7:6]};
	end
	else if (B == 31'h7)
	begin
		O[31:8] = A[31:8];
		O[7:0] = {A[6:0], A[7]};
	end
	else
		O = A;
end

endmodule