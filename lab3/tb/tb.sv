/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Testbench with SIMULATED MEMORIES
// Project Name: risc-v 
//
// Description:
// The testbench includes the RISC-V core and two wrappers that simulate memories which
// implement the OBI protocol. The delays of the two memories are randomized through the 
// use of an LFSR and simulate response times that are independent on the processor pipeline.
// The main task of the test is to verify the correct behaviour of the processor in this
// fully general circumstance.
//
/*--------------------------------------------------------------------------------------*/


`timescale 1 ps / 1 ps

module tb import riscv_pkg::*; ();

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
		.CLK(tb_CLK),
		.EN(tb_EN),
		.RSTn(tb_RSTn),

		.data_mem_rdy(tb_data_mem_rdy),
		.data_valid(tb_data_valid), 
		.data_rdata(tb_data_rdata), 
		.data_addr(tb_data_addr),
		.data_wdata(tb_data_wdata),
		.data_proc_req(tb_data_proc_req), 
		.data_we(tb_data_we),
		.instr_mem_rdy(tb_instr_mem_rdy),
		.instr_valid(tb_instr_valid), 
		.instr_rdata(tb_instr_rdata), 
		.instr_addr(tb_instr_addr),
		.instr_wdata(tb_instr_wdata),
		.instr_proc_req(tb_instr_proc_req), 
		.instr_we(tb_instr_we) 
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