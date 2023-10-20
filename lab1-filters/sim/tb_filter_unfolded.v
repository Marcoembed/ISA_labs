//`timescale 1ns

module tb_filter ();

   parameter NBIT = 16;   

   wire CLK_i;
   wire RST_n_i;
   wire [15:0] DIN3k_i;
   wire [15:0] DIN3k1_i;
   wire [15:0] DIN3k2_i;   
   wire VIN_i;
   wire [NBIT-1:0] B0_i;
   wire [NBIT-1:0] B1_i;
   wire [NBIT-1:0] B2_i;
   wire [NBIT-1:0] B3_i;
   wire [NBIT-1:0] A1_i;
   wire [NBIT-1:0] A2_i;   
   wire [NBIT-1:0] DOUT3k_i;
   wire [NBIT-1:0] DOUT3k1_i;
   wire [NBIT-1:0] DOUT3k2_i;   
   wire VOUT_i;
   wire END_SIM_i;

   clk_gen CG(.END_SIM(END_SIM_i),
  	      .CLK(CLK_i),
	      .RST_n(RST_n_i));

   data_maker #(.NBIT(NBIT)) SM(.CLK(CLK_i),
				.RST_n(RST_n_i),
				.VOUT(VIN_i),
				.DOUT3k(DIN3k_i),
				.DOUT3k1(DIN3k1_i),
				.DOUT3k2(DIN3k2_i),				
				.B0(B0_i),
				.B1(B1_i),
				.B2(B2_i),
				.B3(B3_i),
				.A1(A1_i),
				.A2(A2_i),
				.END_SIM(END_SIM_i));

   myfilter UUT(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.DIN3k(DIN3k_i),
		.DIN3k1(DIN3k1_i),
		.DIN3k2(DIN3k2_i),		
		.VIN(VIN_i),
		.B0(B0_i),
		.B1(B1_i),
		.B2(B2_i),
		.B3(B3_i),
		.A1(A1_i),
		.A2(A2_i),
		.DOUT3k(DOUT3k_i),
		.DOUT3k1(DOUT3k1_i),
		.DOUT3k2(DOUT3k2_i),		
		.VOUT(VOUT_i)); 

   data_sink #(.NBIT(NBIT)) DS(.CLK(CLK_i),
			       .RST_n(RST_n_i),
			       .VIN(VOUT_i),
			       .DIN3k(DOUT3k_i),
			       .DIN3k1(DOUT3k1_i),
			       .DIN3k2(DOUT3k2_i));

endmodule

		   
