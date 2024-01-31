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

import riscv_pkg::*;
module exe (
	//input CLK, EN, RSTn,

    // input control signals
    input   EX_ctrl 	    EXctrl_in,
	input   FU_mux          FUctrl_in,
    input   ALU_ctrl 	    ALUctrl_in,

    // input data signals
    input   logic [31:0]    EXdata_FRWDALU_in,
    input   logic [31:0]    EXdata_FRWDWB_in,
	input   logic [31:0]	EXdata_PC_in,
	input   logic [31:0] 	EXdata_IMM_in,
	input   logic [31:0] 	EXdata_RS1_in,
	input   logic [31:0] 	EXdata_RS2_in,

    // output data signals
	output  logic [31:0] 	EXdata_ALU_out,
    output  logic [31:0]    EXdata_IMM_out,

);

// signals
    logic [31:0] MUXA_out;
    logic [31:0] MUXB_out;
    logic [31:0] OP1;
    logic [31:0] OP2;


// PORTMAP

// ALU Unit for Arithmetic operations
    alu alu_unit (
        .op1        (OP1),
        .op2        (OP2),
        .ALUopr     (EXctrl_in.ALUopr),
        .ALUResult  (EXdata_ALU_out)
    );

    always_comb begin
        EXdata_IMM_out = EXdata_IMM_in;
    end

// MUX to feed ALU    
	always_comb begin

        // first MUXA
        case (FUctrl_in.FRWD_A)
            FORWARD_alu: begin
                MUXA_out = EXdata_FRWDALU_in;
            end

            FORWARD_wb: begin
                MUXA_out = EXdata_FRWDWB_in;
            end

            NOFORWARD: begin
                MUXA_out = EXdata_RS1_in;
            end
        endcase

        // first MUXB
        case (FUctrl_in.FRWD_B)
            FORWARD_alu: begin
                MUXB_out = EXdata_FRWDALU_in;
            end

            FORWARD_wb: begin
                MUXB_out = EXdata_FRWDWB_in;
            end

            NOFORWARD: begin
                MUXB_out = EXdata_RS2_in;
            end
        endcase

        // second MUXA
        case (EXctrl_in.ALUsrcA)
            RS1: begin
                OP1 = MUXA_out;
            end

            PC: begin
                OP1 = EXdata_PC_in;
            end
        endcase

        // second MUXB
        case (EXctrl_in.ALUsrcB)
            RS2: begin
                OP2 = MUXB_out;
            end

            IMM: begin
                OP2 = EXdata_IMM_in;
            end
        endcase

	end

endmodule
