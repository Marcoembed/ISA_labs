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
    input logic[31:0] MEMdata_ALU_in,
    input logic[31:0] MEMdata_IMM_in,
    input logic[31:0] MEMdata_MEM_in,

    // Data output signals
    output logic[31:0] MEMdata_MUX_out
);



always_comb begin
    case (WBctrl_in.SRCtoRF)
        ALUtoRF: begin
            MEMdata_MUX_out = MEMdata_ALU_in;
        end

        MEMtoRF: begin
            MEMdata_MUX_out = MEMdata_MEM_in;
        end

        IMMtoRF: begin
            MEMdata_MUX_out = MEMdata_IMM_in;
        end
        
    endcase
end

endmodule