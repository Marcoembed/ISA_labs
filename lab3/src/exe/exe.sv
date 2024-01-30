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

    //TODO cambiare nome con uno significativo
	input logic [31:0]	WB_Mux_Mux_out,
	output [31:0] 	MEM_in_instr,	
	input [31:0]	MEM_in_ALU_res,
	input [31:0]	EX_in_instr,
    
	output [31:0] 	EX_ALUResult,
);

//---------------------- Execution Stage VAR ------------------------//
	wire [31:0]	EX_Mux_ALUIN1;
	wire [31:0]	EX_Mux_ALUIN2;
	wire [31:0] EX_Mux_Mux_ALUIN1;
	wire [31:0] EX_Mux_Mux_ALUIN2;
	wire [31:0] EX_Mux_Mux_Mux_ALUIN1;
	wire [31:0] EX_Mux_Mux_Mux_ALUIN2;
	ALUControl_Enum	EX_ALUControl;
    
	//assign EXECUTE_INSTRUCTION = Instruction_Enum'(EX_in_instr);

// END	

	// ALU Unit for Arithmetic operations
    alu alu_unit (
        .op1        (),
        .op2        (),
        .ALUopr     (EX_ctrl.ALUopr),
        .ALUResult  ()
    );

    //Mux to feed ALU    

	always_comb begin
		case ()
			: begin
				 
			end
			
			ALU_SUB: begin
				ALUResult = op1 - op2;
			end
			
			default : begin
				ALUResult = ADD_Result;
			end
		endcase
	end



	assign EX_Mux_Mux_Mux_ALUIN1 = (Forward_o.ForwardA[2] == FWA_ALURSLT[2]) ? MEM_in_ALU_res : WB_Mux_Mux_out; 
	assign EX_Mux_Mux_Mux_ALUIN2 = (Forward_o.ForwardB[2] == FWB_ALURSLT[2]) ? MEM_in_ALU_res : WB_Mux_Mux_out; 

	assign EX_Mux_Mux_ALUIN1 = (EX_in_EX.ALUsrc[0] == 1'b1) ? EX_in_PC_add : EX_in_reg_data_1;
	assign EX_Mux_Mux_ALUIN2 = (EX_in_EX.ALUsrc[1] == 1'b1) ? EX_in_imm : EX_in_reg_data_2;

	assign EX_Mux_ALUIN1 = 	(Forward_o.ForwardA[0] == NOFWA[0]) ? EX_Mux_Mux_ALUIN1 : EX_Mux_Mux_Mux_ALUIN1;
	assign EX_Mux_ALUIN2 =	(Forward_o.ForwardB[0] == NOFWB[0]) ? EX_Mux_Mux_ALUIN2 : EX_Mux_Mux_Mux_ALUIN2;
			
	
//	flip_flop ex_mem_instr (
//			.d(EX_in_instr), 
//			.rstn(RSTn & HAZARD_BP_o.Ctrl_Mux_EX), 
//			.clk(CLK), 
//			.en(EN), 
//			.q(MEM_in_instr)
//	);

endmodule
