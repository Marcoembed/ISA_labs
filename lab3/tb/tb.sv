`timescale 1 ps / 1 ps

module tb import riscv_pkg::*; ();

	obi_intf fetcher_intf;

	logic CLK, RSTn;
	logic[31:0] PC_in_tb; // FAI IL PROCESS +4
	logic[31:0] INSTR_tb;
	logic BUSY;
	logic VALID_tb;

	assign valid = 1 - BUSY;


	//parameters
   localparam Ts = 10000;
   localparam tco = 1;
   localparam tpd = 1;
   //localparam cRG_FAST = 0;
   localparam cIS_CODE = 0;
   localparam cIS_DATA = 1;   
   localparam cCONTENT_TYPE = cIS_CODE; 


   always_ff @(posedge CLK) begin
	if (!RSTn) begin
		PC_in_tb <= 32'h00400000;
	end else
	if (VALID_tb) begin
	  PC_in_tb <= PC_in_tb + 32'h4;
	end
   end

	clk_gen #(
	     .T( Ts )
   ) CG (
  	 .CLK( CLK ),
	 .RSTn( RSTn )
   );

	fetcher fetcher_unit
	( 
		// control signals
		.CLK(CLK),
		.RSTn(RSTn),

		.HZ_instr_req(),
		.busy_out(BUSY),
		.PC_in(PC_in_tb),
		.INSTR_out(INSTR_tb),

		.fetch_intf(fetcher_intf)
		
	);



	mem_wrap_fake #(
			.CONTENT_TYPE( cCONTENT_TYPE ),
			.tco( tco ),
			.tpd( tpd )
	) UUT (
		.CLK( CLK ),
		.RSTn( RSTn ),
		.PROC_REQ( fetcher_intf.proc_req ),
		.MEM_RDY( fetcher_intf.mem_rdy),
		.ADDR( fetcher_intf.addr ),
		.WE( fetcher_intf.we ),
		.WDATA( fetcher_intf.wdata ),
		.RDATA( fetcher_intf.rdata ),
		.VALID( fetcher_intf.valid )
	);

	data_dumper dd (
		.CLK( CLK ),
		.RSTn( RSTn ),
		.RDATA( INSTR_tb ),
		.VALID( VALID_tb )
		);

	
endmodule