`timescale 1ps/1ps

module tb_mem_wrap_fake ();

   wire        CLK;
   wire        RSTn;
   wire        PROC_REQ;
   wire        MEM_RDY;
   wire [31:0] ADDR;
   wire        WE;
   wire [31:0] WDATA;
   wire [31:0] RDATA;
   wire        VALID;

   localparam Ts = 10000;
   localparam tco = 1;
   localparam tpd = 1;
   localparam cRG_FAST = 0;
   localparam cIS_CODE = 0;
   localparam cIS_DATA = 1;   
   localparam cCONTENT_TYPE = cIS_CODE; 
   
   clk_gen #(
	     .T( Ts )
   ) CG (
  	 .CLK( CLK ),
	 .RSTn( RSTn )
   );

   if (cRG_FAST == 1) begin : RGF1

      req_gen_fast #(
		     .CONTENT_TYPE( cCONTENT_TYPE ),
		     .tco( tco ),
		     .tpd( tpd )
      ) rg (
            .CLK( CLK ),
            .RSTn( RSTn ),
            .PROC_REQ( PROC_REQ ),
            .MEM_RDY( MEM_RDY ),
            .WE( WE ),
            .ADDR( ADDR ),
            .WDATA( WDATA )
      );      
   end // block: RGF1

   if (cRG_FAST == 0) begin : RGF0

      req_gen #(
		.CONTENT_TYPE( cCONTENT_TYPE ),
		.tco( tco ),
		.tpd( tpd )
      ) rg (
            .CLK( CLK ),
            .RSTn( RSTn ),
            .PROC_REQ( PROC_REQ ),
            .MEM_RDY( MEM_RDY ),
            .WE( WE ),
            .ADDR( ADDR ),
            .WDATA( WDATA )
      );      
   end // block: RGF0

   mem_wrap_fake #(
		   .CONTENT_TYPE( cCONTENT_TYPE ),
		   .tco( tco ),
		   .tpd( tpd )
   ) UUT (
      .CLK( CLK ),
      .RSTn( RSTn ),
      .PROC_REQ( PROC_REQ ),
      .MEM_RDY( MEM_RDY ),
      .ADDR( ADDR ),
      .WE( WE ),
      .WDATA( WDATA ),
      .RDATA( RDATA ),
      .VALID( VALID )
   );

  data_dumper dd (
		  .CLK( CLK ),
		  .RSTn( RSTn ),
		  .RDATA( RDATA ),
		  .VALID( VALID )
		  );
         
endmodule
