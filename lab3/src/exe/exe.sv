/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Execution Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

import my_pkg::*;
module exe (
	//input CLK, EN, RSTn,

    input EX_ctrl 	EX_in_EX,
	input FU_ctrl_o Forward_o,
	input HAZARD_ctrl_o HAZARD_BP_o,
	
	input logic [31:0]	EX_in_PC_add,
	input logic [31:0] 	EX_in_imm,
	input logic [31:0] 	EX_in_reg_data_2,
    input logic [31:0] 	EX_in_reg_data_1,
    input ALU_ctrl 	EX_in_ALU_ctrl,

	output [31:0] 	EX_ALUResult,
);

//---------------------- Execution Stage VAR ------------------------//
	ALUControl_Enum	EX_ALUControl;
    
	//assign EXECUTE_INSTRUCTION = Instruction_Enum'(EX_in_instr);

// END	

	// ALU Unit for Arithmetic operations
    alu alu_unit (
        .op1        (op1),
        .op2        (op2),
        .ALUopr     (EX_ctrl.ALUopr),
        .ALUResult  (EX_ALUResult)
    );

    //Mux to feed ALU    

	always_comb begin
        case (FWD_A)
            FWD: begin
                RS1 = Forward_o_A
            end

            NO_FWD: begin
                RS1 = EX_in_reg_data_1
            end
        endcase

        case (FWD_B)
            FWD: begin
                RS2 = Forward_o_B
            end

            NO_FWD: begin
                RS2 = EX_in_reg_data_2
            end
        endcase

		case (ALUsrcA)
			PC: begin
				op1 =  EX_in_PC_add;
			end
			
			RS1: begin
				op1 = RS1;
			end
		endcase

       case (ALUsrcB)
			IMM: begin
				op2 =  EX_in_imm;
			end
			
			RS2: begin
				op2 = RS2;
			end
		endcase 
	end

endmodule
