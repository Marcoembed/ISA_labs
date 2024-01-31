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

module cu import riscv_pkg::*; 
(
	input 	[31:0] instr,
   	output 	DEC_ctrl DEC,	
   	output 	EX_ctrl EX,	
   	output 	MEM_ctrl MEM,	
   	output 	WB_ctrl WB	
);

// Unpacking instruction control bits 

t_opcode  op_code;
assign op_code = t_opcode'(instr[6:0]);

t_funct7 funct7;
assign funct7 = t_funct7'(instr[31:25]);

always_comb begin

	// default op ADD immediate
	DEC.branch 		= NOBRANCH;
	EX.ALUopr  		= ALU_ADD;
	EX.ALUsrcA		= RS1;
	EX.ALUsrcB		= IMM;
	WB.SRCtoRF 		= ALUtoRF;

	unique case (op_code)
		OP_RTYPE		: begin
						  	unique case (funct7)
						  		ADD	: begin EX.ALUopr = ALU_ADD; end
						  		SUB	: begin EX.ALUsrcB = RS2; EX.ALUopr = ALU_SUB; end
							endcase
						  end
		OP_ADDI 		: begin EX.ALUopr = ALU_ADD; EX.ALUsrcB = IMM; end
		OP_AUIPC		: begin EX.ALUopr = ALU_ADD; EX.ALUsrcB = IMM; end
		OP_BRANCH		: begin DEC.branch = BRANCH; end
		OP_JMP			: begin DEC.branch = JMP; end
		OP_LUI 			: begin WB.SRCtoRF = IMMtoRF; end
		OP_LW  			: begin WB.SRCtoRF = MEMtoRF; end
		OP_SW  			: begin end
		OP_RET 			: begin DEC.branch = JMP; end
	endcase

end

endmodule