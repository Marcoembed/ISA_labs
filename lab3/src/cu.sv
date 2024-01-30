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
	input 	[31:0] instr,
   	output 	EX_ctrl EX,	
   	output 	MEM_ctrl MEM,	
   	output 	WB_ctrl WB	
);

// Unpacking instruction control bits 

logic opcode = [6:0] instr;
logic funct3 = [14:12] instr;
logic funct7 = [31:25] instr;

always_comb begin
	EX.is_RTYPE = NORTYPE;
	EX.ALUopr  	= ALU_ADD;
	EX.ALUsrc	= OPB;
	MEM.obi

	case(opcode)
		OP_RTYPE		: begin
						  	case(funct7)
						  		ADD	: begin EX.ALUsrcA = RS1; EX.ALUsrcB = RS2; EX.ALUopr = ALU_ADD; end
						  		SUB	: begin EX.ALUsrcA = RS1; EX.ALUsrcB = RS2; EX.ALUopr = ALU_SUB; end
							endcase
						  end
						
		OP_ADDI 		: begin EX.ALUopr = ALU_ADD; EX.ALUsrc = IMM; end
		OP_AUIPC		: begin EX.ALUopr = ALU_ADD; EX.ALUsrc = IMM; end
		OP_BRANCH		: begin end
		OP_JMP			: begin end
		OP_LUI 			: begin end
		OP_LW  			: begin end
		OP_SW  			: begin end
		OP_RET 			: begin end
	endcase

end

endmodule


