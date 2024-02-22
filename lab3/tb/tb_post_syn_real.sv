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

module tb_post_syn_real import riscv_pkg::*; ();


	// parameters
	localparam Ts = 10000;


	// TB VARIABLES TO MANAGE HEX FILES
	logic [31:0] tmp_imem [0:78];
	logic [31:0] tmp_dmem [0:11];
	
	// GLOBAL SIGNALS
	logic tb_CLK;
	logic tb_EN;
	logic tb_RSTn;

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
		.tmp_dmem(tmp_dmem), 
		.tmp_imem(tmp_imem)
	);

	clk_gen #(
		.T(Ts)
	) CG (
		.CLK(tb_CLK),
		.RSTn(tb_RSTn)
	);



		
endmodule