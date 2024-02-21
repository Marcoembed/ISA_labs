/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: EXECUTE pipe stage
// Project Name: risc-v 
//
// Description:
// In this stage the ALU performs any kind of operation on the incoming data.
// To select each operand for the ALU, a cascade of multiplexers is developed.
//
// The control word coming from the CU selects:
// - For the first  operand -> between the PC and the content of RS1
// - For the second operand -> between the IMMEDIATE and the content of RS2
// 
// The signal coming from the Forwarding Unit selects independently, for RS1 and RS2:
// - Their value in the current execute stage
// - Their value from previous memory stage
// - Their value from the write back stage of 2 clock cycles ago
//
/*--------------------------------------------------------------------------------------*/


module exe import riscv_pkg::*;
(
	input EX_ctrl	EXctrl_in,
	input FU_mux	FUctrl_in,

	// input data signals
	input logic [31:0]	EXdata_FRWDALU_in,
	input logic [31:0]	EXdata_FRWDWB_in,
	input logic [31:0]	EXdata_PC_in,
	input logic [31:0]	EXdata_IMM_in,
	input logic [31:0]	EXdata_RS1_in,
	input logic [31:0]	EXdata_RS2_in,
	
	// output data signals
	output logic [31:0]	EXdata_ALU_out,
	output logic [31:0]	EXdata_IMM_out,

	// output data 
	output logic [31:0]	EXdata_RS2_out

);

	// signals
	logic [31:0] MUXA_out;
	logic [31:0] MUXB_out;
	logic [31:0] OP1;
	logic [31:0] OP2;


	// ALU Unit for Arithmetic operations
	alu alu_unit (
		.op1		(OP1),
		.op2		(OP2),
		.ALUop		(EXctrl_in.ALUopr),
		.ALUResult	(EXdata_ALU_out)
	);

	always_comb begin
		EXdata_IMM_out = EXdata_IMM_in;
	end


	// MUXes to feed ALU
	always_comb begin
		MUXA_out = EXdata_RS1_in;
		MUXB_out = EXdata_RS2_in;
		OP1 = MUXA_out;
		OP2 = EXdata_IMM_in;

		// OPERAND 1 - RS1 forwarding
		case (FUctrl_in.FRWD_A)
			FORWARD_alu:	MUXA_out = EXdata_FRWDALU_in;
			FORWARD_wb:		MUXA_out = EXdata_FRWDWB_in;
			NOFORWARD:		MUXA_out = EXdata_RS1_in;
		endcase

		// OPERAND 2 - RS2 forwarding
		case (FUctrl_in.FRWD_B)
			FORWARD_alu:	MUXB_out = EXdata_FRWDALU_in;
			FORWARD_wb:		MUXB_out = EXdata_FRWDWB_in;
			NOFORWARD:		MUXB_out = EXdata_RS2_in;
		endcase

		// OPERAND 1 - RS1 or PC
		case (EXctrl_in.ALUsrcA)
			RS1:	OP1 = MUXA_out;
			PC:		OP1 = EXdata_PC_in;
		endcase

		// OPERAND 2 - RS2 or IMM
		case (EXctrl_in.ALUsrcB)
			RS2:	OP2 = MUXB_out;
			IMM:	OP2 = EXdata_IMM_in;
		endcase

	end

	// RS2 output
	always_comb begin
		EXdata_RS2_out = MUXB_out;
	end

endmodule
