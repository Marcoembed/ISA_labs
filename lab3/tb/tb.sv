`timescale 1 ns / 1 ps
module DP_TB ();	

	logic CLK;
	logic RSTn;
	logic EN;

	riscv_core riscv_uut(
		.CLK(CLK),
		.EN(EN),
		.RSTn(RSTn)
	);
	

	initial begin
		RSTn = 1'b1;					// Resetting the architecture while loading data 
		#1
		RSTn = 1'b0;					// Resetting the architecture while loading data
		EN = 1'b0; 						// Disable the whole architecture
		CLK = 1'b0;
	end

	
endmodule