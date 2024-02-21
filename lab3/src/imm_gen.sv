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
	input	logic[31:0]	instruction_i, 
	output	logic[31:0]	immediate_o
);

	t_opcode op_code;
	assign op_code = t_opcode'(instruction_i[6:0]);


	always_comb begin

		case (op_code)
			OP_RTYPE:	immediate_o = 32'b0;
			OP_ADDI:	immediate_o = {20'(signed'(instruction_i[31])), instruction_i[31:20]};
			OP_AUIPC:	immediate_o = {instruction_i[31:12], 12'b0};
			OP_BRANCH:	immediate_o = {instruction_i[31], instruction_i[7], instruction_i[30:25], instruction_i[11:8], 1'b0};
			OP_JMP:		immediate_o = {12'(signed'(instruction_i[31])), instruction_i[19:12], instruction_i[20], instruction_i[30:21], 1'b0};
			OP_LUI:		immediate_o = {instruction_i[31:12], 12'b0};
			OP_LW:		immediate_o = {20'(signed'(instruction_i[31])), instruction_i[31:20]};
			OP_SW:		immediate_o = {20'(signed'(instruction_i[31])), instruction_i[31:25], instruction_i[11:7]};
			OP_RET:		immediate_o = 32'b0;
			default:	immediate_o = 32'b0;
		endcase

	end

endmodule