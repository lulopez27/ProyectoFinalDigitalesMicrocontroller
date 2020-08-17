`timescale 100 ms / 100 ms
module processor_tb();
	logic clk,rst;
	microprocessor microDUT(clk,rst);
//	logic[3:0] s,finish;
//	reg_4bit regs(clk,rst,en,s,finish);
//	
	initial begin
	clk=0;
	rst=0;
	#1
	rst=1;
	#1
	rst=0;
	end
	always
	#5 clk=!clk;

//int fd_w;
//int i=1;
//	always begin
//		#50 if(finish == 1)
//		begin
//		#50
//		assign en_read2=0;
//		#50
//		fd_w = $fopen ("./msg2.txt", "w");
//		#50
//		address2=0;
//		#50
//		for(;i<51;)
//		begin
//			#100 address2=i;
//			i=i+1;
//			$fdisplay (fd_w, "Iteration = %s", q);
//		end
//		$fclose(fd_w);
//		#10
//		$finish;
//		end	
//		end
	
endmodule
//vsim -L altera_mf_ver -L lpm_ver processor_tb
//add wave -position end sim:/processor_tb/*
//add wave -position end  sim:/processor_tb/microDUT/currPC
//add wave -position end  sim:/processor_tb/microDUT/Instr