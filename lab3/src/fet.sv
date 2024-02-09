/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Fetch Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

module fet import riscv_pkg::*;
( 
    // control input signals
    input logic CLK,
    input logic RSTn,
    input logic EN,
    input HAZARD_ctrl HZctrl_in,
    input logic BRANCH_cond_in,

    // data input signals
    input logic [31:0] BRANCH_in,

    output logic [31:0] PC_out
);

logic [31:0] NPC;
logic [31:0] PC;
logic [31:0] MUX_out;

always_comb begin : fetch 

    NPC = PC + 4;

    if (BRANCH_cond_in) begin
        MUX_out = BRANCH_in;
    end
    else begin
        MUX_out = NPC;
    end
  
end

always_ff @(posedge CLK) begin : PC_reg
    if (RSTn == 0 || HZctrl_in == FLUSH) begin
       PC <= 0; 
    end
    else if (HZctrl_in == ENABLE) begin
       PC <= MUX_out; 
    end
end

assign PC_out = PC;

endmodule