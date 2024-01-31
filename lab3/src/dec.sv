/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Decode Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

// TARGET = PC + IMM ESTESO

module dec import riscv_pkg::*;
(
    input   DEC_ctrl        DECctrl_in,
    input   logic[31:0]     IDdata_INSTRUCTION_in,
    input   logic [31:0]    IDdata_PC_in,


    output   logic [31:0]   MEMdata_PC_out,
    output   logic [31:0]   MEMdata_IMM_out,
    output   logic [31:0]   MEMdata_RS1_out,
    output   logic [31:0]   MEMdata_RS2_out,
    

);

    logic [4:0] RS1;
    logic [4:0] RS2;

    imm_gen imm_gen_unit (
        .instruction_i(IDdata_INSTRUCTION_in),
        .immediate_o(MEMdata_IMM_out)
    );

    bu bu_unit (
        .DECctrl_in(DECctrl_in),
        .RS1()
    );

    always_comb begin
        
        
    end
    
endmodule