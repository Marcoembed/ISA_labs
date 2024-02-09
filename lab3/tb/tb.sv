`timescale 1 ps / 1 ps

module tb import riscv_pkg::*; ();

	obi_intf fetcher_intf();

	logic CLK, RSTn;
	logic[31:0] tb_PC_in; // FAI IL PROCESS +4
	logic[31:0] tb_instr;
	logic tb_busy;

	logic tb_proc_req;
    logic tb_mem_rdy;
	logic tb_we;
    logic [31:0] tb_addr;
    logic [31:0] tb_wdata;
    logic [31:0] tb_rdata;
    logic tb_valid;


	// parameters
	localparam Ts = 10000;
	localparam tco = 1;
	localparam tpd = 1;
	//localparam cRG_FAST = 0;
	localparam cIS_CODE = 0;
	localparam cIS_DATA = 1;   
	localparam cCONTENT_TYPE = cIS_CODE; 

	// Interface unpacking
	always_comb begin
    	tb_proc_req = logic'(fetcher_intf.proc_req);
    	tb_we = logic'(fetcher_intf.we);
    	tb_addr = fetcher_intf.addr;
    	tb_wdata = fetcher_intf.wdata;

    	fetcher_intf.mem_rdy = tb_mem_rdy;
    	fetcher_intf.rdata = tb_rdata;
    	fetcher_intf.valid = tb_valid;
	end


	always_ff @(posedge CLK) begin
		if (!RSTn) begin
			tb_PC_in <= 32'h00400000;
		end else
		if (!tb_busy) begin
		  tb_PC_in <= tb_PC_in + 32'h4;
		end
   end

	clk_gen #(
		.T(Ts)
   ) CG (
  	 .CLK(CLK),
	 .RSTn(RSTn)
   );

	fetcher fetcher_unit
	( 
		// control signals
		.CLK(CLK),
		.RSTn(RSTn),

		.HZ_instr_req('1),
		.busy_out(tb_busy),
		.PC_in(tb_PC_in),
		.INSTR_out(tb_instr),

		.fetch_intf(fetcher_intf.to_mem)
		
	);



	mem_wrap_fake #(
			.CONTENT_TYPE(cCONTENT_TYPE),
			.tco(tco),
			.tpd(tpd)
	) UUT (
		.CLK(CLK),
		.RSTn(RSTn),
		.PROC_REQ(tb_proc_req),
		.MEM_RDY(tb_mem_rdy),
		.ADDR(tb_PC_in),
		.WE(tb_we),
		.WDATA(tb_wdata),
		.RDATA(tb_rdata),
		.VALID(tb_valid)
	);

	data_dumper dd (
		.CLK(CLK),
		.RSTn(RSTn),
		.RDATA(tb_instr),
		.VALID(tb_valid)
		);

	
endmodule