/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Testbench for POST SYNTHESIS netlist
// Project Name: risc-v 
//
/*--------------------------------------------------------------------------------------*/


`timescale 1 ps / 1 ps

module tb_post_syn import riscv_pkg::*; ();


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
	


	riscv_core core 
	( 
		.fetch_intf_core_proc_req(tb_instr_proc_req), 
		.fetch_intf_core_we(tb_instr_we), 
		.fetch_intf_core_addr(tb_instr_addr), 
		.fetch_intf_core_wdata(tb_instr_wdata), 
		.fetch_intf_core_mem_rdy(tb_instr_mem_rdy), 
		.fetch_intf_core_valid(tb_instr_valid), 
		.fetch_intf_core_rdata(tb_instr_rdata), 
		.lsu_intf_core_proc_req(tb_data_proc_req), 
		.lsu_intf_core_we(tb_data_we), 
		.lsu_intf_core_addr(tb_data_addr), 
		.lsu_intf_core_wdata(tb_data_wdata), 
		.lsu_intf_core_mem_rdy(tb_data_mem_rdy), 
		.lsu_intf_core_valid(tb_data_valid), 
		.lsu_intf_core_rdata(tb_data_rdata), 
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
		.ADDR(tb_data_addr),
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
		.ADDR(tb_instr_addr),
		.WE(tb_instr_we),
		.WDATA(tb_instr_wdata),
		.RDATA(tb_instr_rdata),
		.VALID(tb_instr_valid)
	);

	
endmodule