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

module preg_mem_wb import riscv_pkg::*;
	(

	// clock, reset signals
	input logic CLK,
	input logic EN,
	input logic RSTn,


    // control input signals
	input WB_ctrl 	WBctrl_in,
	input HAZARD_ctrl HZctrl_in,

	// control output signals
	output WB_ctrl 	WBctrl_out,

    // data input signals
	input logic [width-1:0] imm_in,
	input logic [width-1:0] dataALU_in,
	input logic [width-1:0] dataMEM_in,
	input logic [reg_width-1:0] rd_in,

    // data output signals
	output logic [width-1:0] imm_out,
	output logic [width-1:0] dataALU_out,
	output logic [width-1:0] dataMEM_out,
	output logic [reg_width-1:0] rd_out

);

logic HZ_en;

always_comb begin 
	if (HZctrl_in == STALL) begin
		HZ_en = 0;
	end
end

always_ff @( posedge CLK , posedge RSTn) begin : ex_mem

	if (RSTn == 0 || HZctrl_in == FLUSH) begin

		// Control signals
		WBctrl_out 	<= '0;

		// Data signals
		imm_out		 <= '0; 
		dataALU_out	 <= '0; 
		dataMEM_out	 <= '0; 
		rd_out       <= '0; 
                       	   
	end	else if (EN && HZ_en) begin
		// Control signals
		WBctrl_out 	<= WBctrl_in;

		// Data signals
		imm_out         <= imm_in;        
		dataALU_out     <= dataALU_in;       
		dataMEM_out     <= dataMEM_in;       
		rd_out          <= rd_in;  
	end

	
end

endmodule
