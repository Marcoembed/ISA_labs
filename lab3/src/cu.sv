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
	input 	[31:0] INSTR,
	input 	HAZARD_ctrl FLUSH_IF_DEC,
   	output 	DEC_ctrl DEC,	
   	output 	EX_ctrl EX,	
	output	MEM_ctrl MEM,
   	output 	WB_ctrl WB	
);


// Unpacking instruction control bits 
t_opcode  opcode;
t_funct7 funct7;

assign funct7 = t_funct7'(INSTR[31:25]);

always_comb begin

	opcode = t_opcode'(INSTR[6:0]);

	if (FLUSH_IF_DEC == FLUSH) begin
		opcode = OP_ADDI; // NOP operation
	end

	// default op ADD immediate
	DEC.branch 		= NOBRANCH;
	EX.ALUopr  		= ALU_ADD;
	EX.ALUsrcA		= RS1;
	EX.ALUsrcB		= IMM;
	MEM.mem_en		= 0;
	MEM.wr			= READ;
	WB.SRCtoRF 		= ALUtoRF;
	WB.RF_we		= NOWR;

	case (opcode)
		OP_RTYPE		: begin
						  	case (funct7)
						  		ADD	: begin EX.ALUopr = ALU_ADD; WB.RF_we = WR; end
						  		SUB	: begin EX.ALUsrcB = RS2; EX.ALUopr = ALU_SUB; WB.RF_we = WR; end
							endcase
						  end
		OP_ADDI 		: begin EX.ALUopr = ALU_ADD; EX.ALUsrcB = IMM; WB.RF_we = WR; end
		OP_AUIPC		: begin EX.ALUopr = ALU_ADD; EX.ALUsrcB = IMM; WB.RF_we = WR; end
		OP_BRANCH		: begin DEC.branch = BRANCH; end
		OP_JMP			: begin DEC.branch = JMP; end
		OP_LUI 			: begin WB.RF_we = WR; WB.SRCtoRF = IMMtoRF; end
		OP_LW  			: begin MEM.mem_en = 1; WB.RF_we = WR; WB.SRCtoRF = MEMtoRF; end
		OP_SW  			: begin MEM.mem_en = 1; MEM.wr = WRITE; end
		OP_RET 			: begin DEC.branch = JMP; end
	endcase

end

endmodule