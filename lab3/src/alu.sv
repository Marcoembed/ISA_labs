/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Arithmetic Logic Unit
// Project Name: risc-v 
//
// Description:
// The ALU is in charge of performing all required arithmetic and logic 
// operations among 2 input operands. The kind of function to apply is decided
// upon a dedicated field, called ALUop. The result is outputted through ALUResult.
//
/*--------------------------------------------------------------------------------------*/


module alu import riscv_pkg::*;
(  
			input logic [31:0] op1, 
			input logic [31:0] op2,
			input ALU_ctrl ALUop,
			output logic [31:0] ALUResult 
);
	
	always_comb begin
		ALUResult = op1 + op2;

		case (ALUop)
			ALU_ADD: begin
				ALUResult = op1 + op2; 
			end
			
			ALU_SUB: begin
				ALUResult = op1 - op2;
			end

			ALU_NOP: begin
				ALUResult = op2;
			end	
			
		endcase
	end
endmodule
