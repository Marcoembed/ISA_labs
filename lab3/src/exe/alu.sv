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

import my_pkg::*;

module ALU (input logic [31:0] op1, 
			input logic [31:0] op2,
			input ALU_ctrl ALUopr,
			output reg [31:0] ALUResult, 
);
	
	always_comb begin
		case (ALUControl)
			ALU_ADD: begin
				ALUResult = op1 + op2; 
			end
			
			ALU_SUB: begin
				ALUResult = op1 - op2;
			end
			
			default : begin
				ALUResult = ADD_Result;
			end
		endcase
	end
endmodule