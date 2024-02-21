/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: WRITE BACK pipe stage
// Project Name: risc-v 
//
// Description:
// The last pipeline stage, Write Back (WB) must select the data that has to be written
// to the Register File upon the Control Word from the CU.
//
// Four possible sources can be selected:
// - The result of the ALU
// - The data read from the memory
// - The immediate value
// - The value of Next Program Counter
//
/*--------------------------------------------------------------------------------------*/


module wb import riscv_pkg::*;
	(
	// Control input signals
	input WB_ctrl WBctrl_in,

	// Data input signals
	input logic[31:0] WBdata_ALU_in,
	input logic[31:0] WBdata_IMM_in,
	input logic[31:0] WBdata_MEM_in,
	input logic[31:0] WBdata_NPC_in,

	// Data output signals
	output logic[31:0] WBdata_MUX_out
);



always_comb begin

	WBdata_MUX_out = WBdata_ALU_in;

	case (WBctrl_in.SRCtoRF)

		ALUtoRF:	WBdata_MUX_out = WBdata_ALU_in;
		MEMtoRF:	WBdata_MUX_out = WBdata_MEM_in;
		IMMtoRF:	WBdata_MUX_out = WBdata_IMM_in;
		NPCtoRF:	WBdata_MUX_out = WBdata_NPC_in;

	endcase
end

endmodule