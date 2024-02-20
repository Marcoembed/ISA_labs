`timescale 1 ps / 1 ps

module tb_mem_real import riscv_pkg::*; ();


	// parameters
	localparam Ts = 10000;
	localparam tco = 1;
	localparam tpd = 1;
	//localparam cRG_FAST = 0;
	localparam cIS_CODE = 0;
	localparam cIS_DATA = 1;   

	parameter IMEM_LENGTH = 12;
	parameter DMEM_LENGTH = 79;

	// TB VARIABLES TO MANAGE HEX FILES
	logic [10-1:0] tmp_imem [32-1:0];
	logic [10-1:0] tmp_dmem [32-1:0];
	int imem_itr = 0;
	int dmem_itr = 0;


	// GLOBAL SIGNALS
	logic tb_CLK;
	logic tb_EN;
	logic tb_RSTn;

	// INSTRUCTION MEMORY INTERFACE SIGNALS
	obi_intf tb_fetch_intf_core();
	logic instr_csb;
	logic instr_web;
	logic [ 9:0] instr_addr;
	logic [31:0] instr_dout;
	logic [31:0] instr_din;

	// DATA MEMORY INTERFACE SIGNALS
	obi_intf tb_lsu_intf_core();
	logic data_csb;
	logic data_web;
	logic [ 9:0] data_addr;
	logic [31:0] data_dout;
	logic [31:0] data_din;

	// INSTRUCTION MEMORY SIGNALS
	logic instr_csb0;
	logic instr_web0;
	logic [ 9:0]  instr_addr0;
	logic [31:0] instr_din0;
	
	// DATA MEMORY SIGNALS
	logic data_csb0;
	logic data_web0;
	logic [ 9:0] data_addr0;
	logic [31:0] data_din0;

	// TB INSTRUCTION MEMORY SIGNALS
	logic tb_instr_csb0;
	logic tb_instr_web0;
	logic [ 9:0]  tb_instr_addr0;
	logic [31:0] tb_instr_din0;
	
	// TB DATA MEMORY SIGNALS
	logic tb_data_csb0;
	logic tb_data_web0;
	logic [ 9:0] tb_data_addr0;
	logic [31:0] tb_data_din0;


	// At startup, the instruction and data hex files are
	// loaded inside two TB variables
	initial begin
		$readmemh("../sim/imem.txt", tmp_imem);
		$readmemh("../sim/dmem.txt", tmp_dmem);
	end


	//-----------------------------------------------------------------
	//   COMPONENTS
	//-----------------------------------------------------------------
	riscv_core core (
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
		.RSTn()
	);


	ssram_wrap ssram_wrap_instr (
		.CLK_in(tb_CLK),
		.RSTn_in(tb_RSTn),

		// SSRAM signals
		.csb(instr_csb),
		.web(instr_web),
		.addr(instr_addr),
		.dout(instr_dout),
		.din(instr_din),
		
		// processor signals
		.obi_intf_in(tb_fetch_intf_core)
	);


	mem_test instr_mem (
		.clk0(tb_CLK),
		.csb0(instr_csb0),
		.web0(instr_web0),
		.addr0(instr_addr0),
		.din0(instr_din0),
		.dout0(instr_dout)
	);


	ssram_wrap ssram_wrap_data (   
		.CLK_in(tb_CLK),
		.RSTn_in(tb_RSTn),

		// SSRAM signals
		.csb(data_csb),
		.web(data_web),
		.addr(data_addr),
		.dout(data_dout),
		.din(data_din),

		// processor signals
		.obi_intf_in(tb_lsu_intf_core)
	);


	mem_test data_mem (
		.clk0(tb_CLK),
		.csb0(data_csb0),
		.web0(data_web0),
		.addr0(data_addr0),
		.din0(data_din0),
		.dout0(data_dout)
	);



	//-----------------------------------------------------------------
	//   PROCESSES TO MANAGE MEMORY FLASHING
	//-----------------------------------------------------------------

	always_ff @(posedge tb_CLK) begin

		if(imem_itr < IMEM_LENGTH) begin
			imem_itr <= imem_itr + 1;
		end

		if(dmem_itr < DMEM_LENGTH) begin
			dmem_itr <= dmem_itr + 1;
		end

	end


	always_comb begin

		tb_RSTn = 0;

		instr_csb0 = instr_csb;
		instr_web0 = instr_web;
		instr_addr0 = instr_addr;
		instr_din0 = instr_din;

		data_csb0 = data_csb;
		data_web0 = data_web;
		data_addr0 = data_addr;
		data_din0 = data_din;

		if (imem_itr < IMEM_LENGTH) begin
			instr_csb0 = 1;
			instr_web0 = 1;
			instr_addr0 = imem_itr;
			instr_din0 = tmp_imem[imem_itr];
		end

		if (dmem_itr < DMEM_LENGTH) begin
			data_csb0 = 1;
			data_web0 = 1;
			data_addr0 = dmem_itr;
			data_din0 = tmp_dmem[dmem_itr];
		end

		if (imem_itr == IMEM_LENGTH and dmem_itr == DMEM_LENGTH) begin
			tb_RSTn = 1;
		end
	end
		
endmodule