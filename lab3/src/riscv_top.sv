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

	input	int imem_itr,
	input 	int dmem_itr,
	input	logic [31:0] instr_i,
	input 	logic [31:0] data_i,

	input	logic imem_end,
	input	logic dmem_end
);
	
	
	logic data_mem_rdy_top;
	logic data_valid_top; 
	logic [31:0] data_rdata_top; 
	logic [31:0] data_addr_top;
	logic [31:0] data_wdata_top;
	logic data_proc_req_top; 
	logic data_we_top;

	logic instr_mem_rdy_top;
	logic instr_valid_top; 
	logic [31:0] instr_rdata_top; 
	logic [31:0] instr_addr_top;
	logic [31:0] instr_wdata_top;
	logic instr_proc_req_top; 
	logic instr_we_top; 


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

	parameter DMEM_LENGTH = 12;
	parameter IMEM_LENGTH = 79;

	// INSTRUCTION MEMORY INTERFACE SIGNALS
	logic instr_csb_wrap;
	logic instr_web_wrap;
	logic [9:0] instr_addr_wrap;
	logic [31:0] instr_dout_wrap;
	logic [31:0] instr_din_wrap;

	// DATA MEMORY INTERFACE SIGNALS
	logic data_csb_wrap;
	logic data_web_wrap;
	logic [9:0] data_addr_wrap;
	logic [31:0] data_dout_wrap;
	logic [31:0] data_din_wrap;


	//-----------------------------------------------------------------
	//   COMPONENTS
	//-----------------------------------------------------------------
		riscv_core core 
	(
		.CLK(CLK),
		.EN(EN),
		.RSTn(RSTn),

		.data_mem_rdy(data_mem_rdy_top),
		.data_valid(data_valid_top), 
		.data_rdata(data_rdata_top), 
		.data_addr(data_addr_top),
		.data_wdata(data_wdata_top),
		.data_proc_req(data_proc_req_top), 
		.data_we(data_we_top),
		.instr_mem_rdy(instr_mem_rdy_top),
		.instr_valid(instr_valid_top), 
		.instr_rdata(instr_rdata_top), 
		.instr_addr(instr_addr_top),
		.instr_wdata(instr_wdata_top),
		.instr_proc_req(instr_proc_req_top), 
		.instr_we(instr_we_top) 
	);
	

	ssram_wrap ssram_wrap_instr (
		.CLK_in(CLK),
		.RSTn_in(RSTn),

		// SSRAM signals
		.csb(instr_csb_wrap),
		.web(instr_web_wrap),
		.addr(instr_addr_wrap),
		.dout(instr_dout_wrap),
		.din(instr_din_wrap),

		.obi_mem_rdy(instr_mem_rdy_top),
		.obi_valid(instr_valid_top), 
		.obi_rdata(instr_rdata_top), 
		.obi_addr(instr_addr_top),
		.obi_wdata(instr_wdata_top),
		.obi_proc_req(instr_proc_req_top), 
		.obi_we(instr_we_top)
		
	);


	sram_32_1024_freepdk45 instr_mem (
		.clk0(CLK),
		.csb0(instr_csb0),
		.web0(instr_web0),
		.addr0(instr_addr0),
		.din0(instr_din0),
		.dout0(instr_dout_wrap)
	);


	ssram_wrap ssram_wrap_data (   
		.CLK_in(CLK),
		.RSTn_in(RSTn),

		// SSRAM signals
		.csb(data_csb_wrap),
		.web(data_web_wrap),
		.addr(data_addr_wrap),
		.din(data_din_wrap),
		.dout(data_dout_wrap),

		// processor signals

		.obi_mem_rdy(data_mem_rdy_top),
		.obi_valid(data_valid_top), 
		.obi_rdata(data_rdata_top), 
		.obi_addr(data_addr_top),
		.obi_wdata(data_wdata_top),
		.obi_proc_req(data_proc_req_top), 
		.obi_we(data_we_top)
	);


	sram_32_1024_freepdk45 data_mem (
		.clk0(CLK),
		.csb0(data_csb0),
		.web0(data_web0),
		.addr0(data_addr0),
		.din0(data_din0),
		.dout0(data_dout_wrap)
	);

	always_comb begin 
		
		instr_csb0 = instr_csb_wrap;
		instr_web0 = instr_web_wrap;
		instr_addr0 = instr_addr_wrap;
		instr_din0 = instr_din_wrap;

		data_csb0 = data_csb_wrap;
		data_web0 = data_web_wrap;
		data_addr0 = data_addr_wrap;
		data_din0 = data_din_wrap;
	
		if (!imem_end) begin
			instr_csb0 = 0;
			instr_web0 = 0;
			instr_addr0 = imem_itr;
			instr_din0 = instr_i;
		end

		if (!dmem_end) begin
			data_csb0 = 0;
			data_web0 = 0;
			data_addr0 = dmem_itr;
			data_din0 = data_i;
		end


	end

		
endmodule