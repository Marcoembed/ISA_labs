`timescale 1 ps / 1 ps

module tb import riscv_pkg::*; ();

	obi_intf tb_fetch_intf_core();
	obi_intf tb_lsu_intf_core();
	logic tb_CLK;
	logic tb_EN;
	logic tb_RSTn;


	//DATA MEMORY
	logic tb_data_proc_req;
	logic tb_data_mem_rdy;
	logic tb_data_we;
	logic [31:0] tb_data_addr;
	logic [31:0] tb_data_wdata;
	logic [31:0] tb_data_rdata;
	logic tb_data_valid;

	//INSTRUCTION MEMORY
	logic tb_instr_proc_req;
	logic tb_instr_mem_rdy;
	logic tb_instr_we;
	logic [31:0] tb_instr_addr;
	logic [31:0] tb_instr_wdata;
	logic [31:0] tb_instr_rdata;
	logic tb_instr_valid;

	//CORE signals 


	// parameters
	localparam Ts = 10000;
	localparam tco = 1;
	localparam tpd = 1;
	//localparam cRG_FAST = 0;
	localparam cIS_CODE = 0;
	localparam cIS_DATA = 1;   
	

	// Interface unpacking

	always_comb begin
		//INSTR
    	tb_instr_proc_req = logic'(tb_fetch_intf_core.proc_req);
    	tb_instr_we = logic'(tb_fetch_intf_core.we);
    	tb_instr_addr = tb_fetch_intf_core.addr;
    	tb_instr_wdata = tb_fetch_intf_core.wdata;

    	tb_fetch_intf_core.mem_rdy = tb_instr_mem_rdy;
    	tb_fetch_intf_core.rdata = tb_instr_rdata;
    	tb_fetch_intf_core.valid = tb_instr_valid;


		//DATA
    	tb_data_proc_req = logic'(tb_lsu_intf_core.proc_req);
    	tb_data_we = logic'(tb_lsu_intf_core.we);
    	tb_data_addr = tb_lsu_intf_core.addr;
    	tb_data_wdata = tb_lsu_intf_core.wdata;

    	tb_lsu_intf_core.mem_rdy = tb_data_mem_rdy;
    	tb_lsu_intf_core.rdata = tb_data_rdata;
    	tb_lsu_intf_core.valid = tb_data_valid;

	end

   riscv_core core 
   (
		.fetch_intf_core(tb_fetch_intf_core),
		.lsu_intf_core(tb_lsu_intf_core),
		.CLK(tb_CLK),
		.EN(tb_EN),
		.RSTn(tb_RSTn)
   );

	clk_gen #(
		.T(Ts)
   ) CG (
  	 .CLK(tb_CLK),
	 .RSTn(tb_RSTn)
   );

	mem_wrap_fake #(
			.CONTENT_TYPE(cIS_DATA),
			.tco(tco),
			.tpd(tpd)
	) DATA_MEM (
		.CLK(tb_CLK),
		.RSTn(tb_RSTn),
		.PROC_REQ(tb_data_proc_req),
		.MEM_RDY(tb_data_mem_rdy),
		.ADDR(tb_data_PC_in),
		.WE(tb_data_we),
		.WDATA(tb_data_wdata),
		.RDATA(tb_data_rdata),
		.VALID(tb_data_valid)
	);

	mem_wrap_fake #(
			.CONTENT_TYPE(cIS_CODE),
			.tco(tco),
			.tpd(tpd)
	) INSTR_MEM (
		.CLK(tb_CLK),
		.RSTn(tb_RSTn),
		.PROC_REQ(tb_instr_proc_req),
		.MEM_RDY(tb_instr_mem_rdy),
		.ADDR(tb_instr_PC_in),
		.WE(tb_instr_we),
		.WDATA(tb_instr_wdata),
		.RDATA(tb_instr_rdata),
		.VALID(tb_instr_valid)
	);

	
endmodule