/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Pipeline Register - EX/MEM
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

module preg_if_dec import riscv_pkg::*;
	(

	// clock, reset signals
	input logic CLK,
	input logic EN,
	input logic RSTn,

    // control input signals
    input HAZARD_ctrl HZctrl_in,

    // data input signals
	input logic [width-1:0] PC_in,
	input logic [width-1:0] INSTR_in,

    // data output signals
	output logic [width-1:0] PC_out,
	output logic [width-1:0] INSTR_out

);

logic HZ_en;

always_comb begin 
	if (HZctrl_in == STALL) begin
		HZ_en = 0;
	end
end

always_ff @( posedge CLK , RSTn) begin : if_dec

	if (RSTn == 0 || HZctrl_in == FLUSH) begin

		// Data signals
		PC_out    <= '0; 
        INSTR_out <= '0;

	end	else if (EN && HZ_en) begin
		// Data signals
		PC_out    <= PC_in; 
        INSTR_out <= INSTR_in;
	end

	
end

endmodule
