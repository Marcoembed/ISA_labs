/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: BRANCH UNIT
// Project Name: risc-v 
//
// Description:
// The Branch Unit is in charge of evaluating which PC to choose whenever a JUMP 
// (both unconditional and conditional) has to be taken.
//
// - For a BRANCH:	target = pc + imm (if condition func3 is true on RS1 and RS2)
// - For a JUMP:	target = pc + imm
// - For a RETURN:	target = rs1
// - Otherwise:		target = npc
//
/*--------------------------------------------------------------------------------------*/


module bu import riscv_pkg::*; 
(
	input DEC_ctrl		DECctrl_in,
	input logic [31:0]	PC_in,
	input logic [31:0]	IMM_in,
	input logic [31:0]	RS1_in,
	input t_funct3		funct3,
	
	output IF_ctrl BRANCH_cond_out,
	output logic [31:0] TARGET_out
);

always_comb begin

	BRANCH_cond_out = NOJUMP;
	TARGET_out = PC_in + IMM_in;

	case (DECctrl_in.branch)
		BRANCH: begin
			case (funct3)
				BLE: begin
					if (signed'(RS1) <= signed'(RS2))
						BRANCH_cond_out = JUMP;
				end

				BLTU: begin
					if (unsigned'(RS1) < unsigned'(RS2))
						BRANCH_cond_out = JUMP;

				end
					
				default: begin
					BRANCH_cond_out = NOJUMP;
				end
				
			endcase
		end

		JMP: begin
			BRANCH_cond_out = JUMP;
		end

		NOBRANCH: begin
			BRANCH_cond_out = NOJUMP;
		end

		RET: begin
			BRANCH_cond_out = JUMP;
			TARGET_out = RS1_in;
		end

		default: begin
			BRANCH_cond_out = NOJUMP;
		end
	endcase
end

endmodule