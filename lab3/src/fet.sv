/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: FETCH pipe stage
// Project Name: risc-v 
//
// Description:
// In this stage the program counter (PC) is updated based on the commands coming 
// from the Hazard unit and from the Branch unit.
//
// The Hazard unit can decide weather the PC must be:
//  - updated regularly with the next ptogram counter (NPC)
//  - cleared to 0 (FLUSH)
//  - kept to its current value (STALL)
// 
// The Branch unit can decide weather the NPC must be:
//  - an increment of 4 applied to the current PC
//  - the target of a jump
//
/*--------------------------------------------------------------------------------------*/


module fet import riscv_pkg::*;
(
	// control input signals
	input logic			CLK,
	input logic			RSTn,
	input logic			EN,
	input HAZARD_ctrl	HZctrl_in,
	input logic			BRANCH_cond_in,

	// data input signals
	input logic [31:0]	BRANCH_in,

	output logic [31:0]	PC_out,
	output logic [31:0]	NPC_out
);

	logic [31:0]	NPC;
	logic [31:0]	PC;
	logic [31:0]	MUX_out;
	
	
	always_comb begin: fetch 
	
		NPC = PC + 4;
	
		if (BRANCH_cond_in)
			MUX_out = BRANCH_in;
		else
			MUX_out = NPC;
	end
	
	
	always_ff @(posedge CLK) begin : PC_reg
	
		if (RSTn == 0 || HZctrl_in == FLUSH)
			PC <= 0;
	
		else if (HZctrl_in == ENABLE)
			PC <= MUX_out; 
	
	end
	
	
	assign PC_out  = PC;
	assign NPC_out = NPC;

endmodule