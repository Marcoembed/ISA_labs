/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Write Back Multiplexer
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/


module wb import riscv_pkg::*;
    (
    // Control input signals
    input WB_ctrl WBctrl_in,

    // Data input signals
    input logic[31:0] WBdata_ALU_in,
    input logic[31:0] WBdata_IMM_in,
    input logic[31:0] WBdata_MEM_in,
    input logic[31:0] WBdata_NPC_in,

    // Data output signals
    output logic[31:0] WBdata_MUX_out
);



always_comb begin
    WBdata_MUX_out = WBdata_ALU_in;

    case (WBctrl_in.SRCtoRF)
        ALUtoRF: begin
            WBdata_MUX_out = WBdata_ALU_in;
        end

        MEMtoRF: begin
            WBdata_MUX_out = WBdata_MEM_in;
        end

        IMMtoRF: begin
            WBdata_MUX_out = WBdata_IMM_in;
        end

        NPCtoRF: begin
            WBdata_MUX_out = WBdata_NPC_in;
        end
        
    endcase
end

endmodule