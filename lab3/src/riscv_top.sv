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
	input logic EN,

	// TB VARIABLES TO MANAGE HEX FILES
	logic [31:0] tmp_imem [0:78],
	logic [31:0] tmp_dmem [0:11]
	
);

	logic top_RSTn; 

	parameter DMEM_LENGTH = 12;
	parameter IMEM_LENGTH = 79;

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


	// INSTRUCTION MEMORY SIGNALS
	logic instr_csb0;
	logic instr_web0;
	logic [9:0]  instr_addr0;
	logic [31:0] instr_din0;
	
	// DATA MEMORY SIGNALS
	logic data_csb0;
	logic data_web0;
	logic [9:0] data_addr0;
	logic [31:0] data_din0;

	int imem_itr = 0;
	int dmem_itr = 0;


	//-----------------------------------------------------------------
	//   COMPONENTS
	//-----------------------------------------------------------------
	riscv_core core (
		.fetch_intf_core(fetch_intf_top),
		.lsu_intf_core(lsu_intf_top),
		.CLK(CLK),
		.EN(EN),
		.RSTn(top_RSTn)
	);


	ssram_wrap ssram_wrap_instr (
		.CLK_in(CLK),
		.RSTn_in(top_RSTn),

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
		.csb0(instr_csb0),
		.web0(instr_web0),
		.addr0(instr_addr0),
		.din0(instr_din0),
		.dout0(instr_dout)
	);


	ssram_wrap ssram_wrap_data (   
		.CLK_in(CLK),
		.RSTn_in(top_RSTn),

		// SSRAM signals
		.csb(data_csb),
		.web(data_web),
		.addr(data_addr),
		.din(data_din),
		.dout(data_dout),

		// processor signals
		.obi_intf_in(lsu_intf_top)
	);


	sram_32_1024_freepdk45 data_mem (
		.clk0(CLK),
		.csb0(data_csb0),
		.web0(data_web0),
		.addr0(data_addr0),
		.din0(data_din0),
		.dout0(data_dout)
	);


	//-----------------------------------------------------------------
	//   PROCESSES TO MANAGE MEMORY FLASHING
	//-----------------------------------------------------------------

	always_ff @(posedge CLK) begin

		if(imem_itr < IMEM_LENGTH) begin
			imem_itr <= imem_itr + 1;
		end

		if(dmem_itr < DMEM_LENGTH) begin
			dmem_itr <= dmem_itr + 1;
		end

	end


	always_comb begin

		top_RSTn = 0;

		instr_csb0 = instr_csb;
		instr_web0 = instr_web;
		instr_addr0 = instr_addr;
		instr_din0 = instr_din;

		data_csb0 = data_csb;
		data_web0 = data_web;
		data_addr0 = data_addr;
		data_din0 = data_din;

		if (imem_itr < IMEM_LENGTH) begin
			instr_csb0 = 0;
			instr_web0 = 0;
			instr_addr0 = imem_itr;
			instr_din0 = tmp_imem[imem_itr];
		end

		if (dmem_itr < DMEM_LENGTH) begin
			data_csb0 = 0;
			data_web0 = 0;
			data_addr0 = dmem_itr;
			data_din0 = tmp_dmem[dmem_itr];
		end

		if (imem_itr == IMEM_LENGTH && dmem_itr == DMEM_LENGTH) begin
			top_RSTn = 1;
		end
	end
		
endmodule