/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Immediate Generator
// Project Name: risc-v 
//
// Description:
// This module generates the immediate value starting from the received instruction.
// Every OPCODE is related to what bits of the instruction are required to build the 
// immediate value, weather it has to be right or left aligned, what padding bits have
// to be added as most/least significant bits, as well as the need for sign extention.
// 
// Refer to:
// RISC-V instruction formats
// https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
//
/*--------------------------------------------------------------------------------------*/


module imm_gen import riscv_pkg::*; 
(
	input	logic[31:0]	instr, 
	output	logic[31:0]	imm
);

	t_opcode op_code;
	assign op_code = t_opcode'(instr[6:0]);


	always_comb begin

		case (op_code)
			// R-type
			OP_RTYPE:					imm = 32'b0;
			// I-type
			OP_ADDI, OP_LW, OP_RET:		imm = {20'(signed'(instr[31])), instr[31:20]};
			// U-type
			OP_AUIPC, OP_LUI:			imm = {instr[31:12], 12'b0};
			// SB-type
			OP_BRANCH:					imm = {19'(signed'(instr[31])), instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
			// UJ-type
			OP_JMP:						imm = {12'(signed'(instr[31])), instr[19:12], instr[20], instr[30:21], 1'b0};
			// S-type
			OP_SW:						imm = {20'(signed'(instr[31])), instr[31:25], instr[11:7]};

			default:	imm = 32'b0;
		endcase

	end

endmodule