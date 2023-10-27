//`timescale 1ns

module tb_iir ();

    wire CLK_i;
    wire RST_n_i;
    wire [9:0] DIN_i;
    wire [9:0] B0_i;
    wire [9:0] B1_i;
    wire [9:0] A1_i;
    wire [9:0] DOUT_i;
    wire VIN_i;
    wire VOUT_i;
    wire END_SIM_i;
 
    clk_gen CG(
 	   	  .END_SIM(END_SIM_i),
   	      .CLK(CLK_i),
 	      .RST_n(RST_n_i));
 
    data_maker SM(
 	     .CLK(CLK_i),
 	     .RST_n(RST_n_i),
 		 .VOUT(VIN_i),
 		 .DOUT(DIN_i),
 		 .B0(B0_i),
 		 .B1(B1_i),
 		 .A1(A1_i),
 		 .END_SIM(END_SIM_i));
 
    iir UUT(
 	   	 .CLK(CLK_i),
 	     .RST_n(RST_n_i),
 	     .X(DIN_i),
         .VIN(VIN_i),
 		 .B0(B0_i),
 		 .B1(B1_i),
 		 .A1(A1_i),
         .Y(DOUT_i),
         .VOUT(VOUT_i));
 
    data_sink DS(
 	    .CLK(CLK_i),
 		.RST_n(RST_n_i),
 		.VIN(VOUT_i),
 		.DIN(DOUT_i));   

endmodule

		   
