/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Control Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/
import riscv_pkg::*;

module cu (
	input 	t_opcode opcode_i,
   	output 	EX_ctrl EX,	
   	output 	MEM_ctrl MEM,	
   	output 	WB_ctrl WB	
);

always_comb begin

	case(opcode_i) 
		OP_RTYPE		: begin EX.is_RTYPE = RTYPE; EX.ALUsrc = OPB; WB.SRCtoRF = ALUtoRF; end
		OP_ADDI 		: begin EX.alu_opr = ALU_ADD; end
		OP_AUIPC		: begin end
		OP_BRANCH		: begin end
		OP_JMP			: begin end
		OP_LUI 			: begin end
		OP_LW  			: begin end
		OP_SW  			: begin end
		OP_RET 			: begin end
end

endmodule


