/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Testbench with REAL MEMORIES
// Project Name: risc-v 
//
// Description:
// The testbench includes the RISC-V core and two real SSRAMs (with their interfaces).
// 
// The test is subdivided into two phases:
// 1 - Memories are filled with files containing instructions and data respectively.
// 2 - The processor is then connected with the memories and the program execution starts.
//
/*--------------------------------------------------------------------------------------*/


`timescale 1 ps / 1 ps

module tb_real import riscv_pkg::*; ();


	// parameters
	localparam Ts = 10000;


	// TB VARIABLES TO MANAGE HEX FILES
	logic [31:0] tmp_imem [0:78];
	logic [31:0] tmp_dmem [0:11];

	parameter DMEM_LENGTH = 12;
	parameter IMEM_LENGTH = 79;

	int imem_itr = -1;
	int dmem_itr = -1;

	logic [31:0] instr_din;
	logic [31:0] data_din;
	
	// GLOBAL SIGNALS
	logic tb_CLK;
	logic tb_EN;
	logic tb_RSTn;

	logic dmem_end;
	logic imem_end;

	// At startup, the instruction and data hex files are
	// loaded inside two TB variables
	initial begin
		$readmemh("../sim/main.txt", tmp_imem);
		$readmemh("../sim/data.txt", tmp_dmem);
	end

	riscv_top riscv (
		.CLK(tb_CLK),
		.RSTn(tb_RSTn), 
		.EN(tb_EN), 
		.imem_itr(imem_itr),
		.dmem_itr(dmem_itr),
		.instr_i(instr_din),
		.data_i(data_din),
		.imem_end(imem_end),
		.dmem_end(dmem_end)

);

	clk_gen #(
		.T(Ts)
	) CG (
		.CLK(tb_CLK),
		.RSTn()
	);

	
	always_ff @(negedge tb_CLK) begin

		if(imem_itr < IMEM_LENGTH) begin
			imem_itr <= imem_itr + 1;
		end

		if(dmem_itr < DMEM_LENGTH) begin
			dmem_itr <= dmem_itr + 1;
		end

	end

	always_comb begin

		if (imem_itr < IMEM_LENGTH) begin
			instr_din = tmp_imem[imem_itr];
			imem_end = 0;
		end else begin
			imem_end = 1;
		end

		if (dmem_itr < DMEM_LENGTH) begin
			data_din = tmp_dmem[dmem_itr];
			dmem_end = 0;
		end else begin
			dmem_end = 1;
		end

		if (imem_itr == IMEM_LENGTH && dmem_itr == DMEM_LENGTH) begin
			tb_RSTn = 1;
		end else begin
			tb_RSTn = 0;
		end

	end

		
endmodule