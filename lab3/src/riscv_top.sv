/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Top Level Entity
// Project Name: risc-v 
//
// Description:
// The full system is made up by the RISC-V core and two real SSRAMs included as 
// SystemVerilog macros. Two interfacing modules (ssram_wrap) are used to 
// accept the OBI protocol from the processor and access the two physical memories.
//
/*--------------------------------------------------------------------------------------*/


module riscv_top import riscv_pkg::*; 
(
	input logic CLK,
	input logic RSTn,
	input logic EN

);

	// GLOBAL SIGNALS
	logic CLK;
	logic EN;
	logic RSTn;

	// INSTRUCTION MEMORY INTERFACE SIGNALS
	obi_intf fetch_intf_top();
	logic instr_csb;
	logic instr_web;
	logic [9:0] instr_addr;
	logic [31:0] instr_dout;
	logic [31:0] instr_din;

	// DATA MEMORY INTERFACE SIGNALS
	obi_intf lsu_intf_top();
	logic data_csb;
	logic data_web;
	logic [9:0] data_addr;
	logic [31:0] data_dout;
	logic [31:0] data_din;

	//-----------------------------------------------------------------
	//   COMPONENTS
	//-----------------------------------------------------------------
	riscv_core core (
		.fetch_intf_core(fetch_intf_top),
		.lsu_intf_core(lsu_intf_top),
		.CLK(CLK),
		.EN(EN),
		.RSTn(RSTn)
	);


	ssram_wrap ssram_wrap_instr (
		.CLK_in(CLK),
		.RSTn_in(RSTn),

		// SSRAM signals
		.csb(instr_csb),
		.web(instr_web),
		.addr(instr_addr),
		.dout(instr_dout),
		.din(instr_din),
		
		// processor signals
		.obi_intf_in(fetch_intf_top)
	);


	sram_32_1024_freepdk45 instr_mem (
		.clk0(CLK),
		.csb0(instr_csb),
		.web0(instr_web),
		.addr0(instr_addr),
		.din0(instr_din),
		.dout0(instr_dout)
	);


	ssram_wrap ssram_wrap_data (   
		.CLK_in(CLK),
		.RSTn_in(RSTn),

		// SSRAM signals
		.csb(data_csb),
		.web(data_web),
		.addr(data_addr),
		.dout(data_dout),
		.din(data_din),

		// processor signals
		.obi_intf_in(lsu_intf_top)
	);


	sram_32_1024_freepdk45 data_mem (
		.clk0(CLK),
		.csb0(data_csb),
		.web0(data_web),
		.addr0(data_addr),
		.din0(data_din),
		.dout0(data_dout)
	);
		
endmodule