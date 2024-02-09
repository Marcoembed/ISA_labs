`timescale 1 ps / 1 ps

module tb import riscv_pkg::*; ();

	obi_intf fetch_intf();

	logic CLK, RSTn;
	logic[31:0] PC_in_tb; // FAI IL PROCESS +4
	logic[31:0] INSTR_tb;
	logic BUSY;
	logic VALID_tb;

	obi_req tb_proc_req;
    logic tb_mem_rdy;
	rdwr tb_we;
    logic [reg_width-1:0] tb_addr;
    logic [width-1:0] tb_wdata;
    logic [width-1:0] tb_rdata;
    logic tb_valid;

	

    assign fetch_intf.proc_req = tb_proc_req;
    assign fetch_intf.mem_rdy = tb_mem_rdy;
    assign fetch_intf.we = tb_we;
    assign fetch_intf.addr = tb_addr;
    assign fetch_intf.wdata = tb_wdata;
    assign fetch_intf.rdata = tb_rdata;
    assign fetch_intf.valid = tb_valid;

	assign tb_valid = 1 - BUSY;


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

		.HZ_instr_req('1),
		.busy_out(BUSY),
		.PC_in(PC_in_tb),
		.INSTR_out(INSTR_tb),

		.fetch_intf(fetcher_intf.to_mem)
		
	);



	mem_wrap_fake #(
			.CONTENT_TYPE( cCONTENT_TYPE ),
			.tco( tco ),
			.tpd( tpd )
	) UUT (
		.CLK( CLK ),
		.RSTn( RSTn ),
		.PROC_REQ(tb_proc_req ),
		.MEM_RDY(tb_mem_rdy),
		.ADDR(tb_addr ),
		.WE(tb_we ),
		.WDATA(tb_wdata ),
		.RDATA(tb_rdata ),
		.VALID(tb_valid )
	);

	data_dumper dd (
		.CLK( CLK ),
		.RSTn( RSTn ),
		.RDATA( INSTR_tb ),
		.VALID( tb_valid )
		);

	
endmodule