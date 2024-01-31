/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Arithmetic Logic Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/


module alu import riscv_pkg::*;
(  
            input logic [31:0] op1, 
			input logic [31:0] op2,
			input ALU_ctrl ALUop,
			output logic [31:0] ALUResult 
);
	
	always_comb begin
		case (ALUop)
			ALU_ADD: begin
				ALUResult = op1 + op2; 
			end
			
			ALU_SUB: begin
				ALUResult = op1 - op2;
			end
			
			default : begin
				ALUResult = op1 + op2;
			end
		endcase
	end
endmodule
