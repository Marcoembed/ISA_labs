/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Pipeline Register - DEC/EX
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/


module preg_dex_ex import riscv_pkg::*;
	(

	// clock, reset signals
	input logic CLK,
	input logic EN,
	input logic RSTn,
	input logic CLR,


    // control input signals
	input EX_ctrl 	EXctrl_in,
	input MEM_ctrl 	MEMctrl_in,
	input WB_ctrl 	WBctrl_in,
	input HAZARD_ctrl HZctrl_in,

	// control output signals
	output MEM_ctrl MEMctrl_out,
	output WB_ctrl 	WBctrl_out,

    // data input signals
	input logic [width-1:0] pc_in, 
	input logic [width-1:0] imm_in, 
	input logic [width-1:0] rs1_data_in, 
	input logic [width-1:0] rs2_data_in, 
	input logic [reg_width-1:0] rd_in, 
	input logic [reg_width-1:0] rs1_in, 
	input logic [reg_width-1:0] rs2_in, 
	input logic bu_cond_in,
	input logic [width-1:0] bu_target_in,

    // data output signals
	output logic [width-1:0] pc_out, 
	output logic [width-1:0] imm_out, 
	output logic [width-1:0] rs1_data_out, 
	output logic [width-1:0] rs2_data_out, 
	output logic [reg_width-1:0] rd_out, 
	output logic [reg_width-1:0] rs1_out, 
	output logic [reg_width-1:0] rs2_out, 
	output logic bu_cond_out,
	output logic [width-1:0] bu_target_out

);

logic HZ_en;

always_comb begin 
	if (HZctrl_in == STALL) begin
		HZ_en = 0;
	end
end
  

always_ff @( posedge CLK ) begin : dex_ex

	if (RSTn == 0 || HZctrl_in == FLUSH) begin

		// Control signals
		MEMctrl_out <= '0;  		// '0 takes care about size based on context		
		WBctrl_out 	<= '0;

		// Data signals
		pc_out		 <= '0; 
		imm_out		 <= '0; 
		rs1_data_out <= '0; 
		rs2_data_out <= '0; 
		rd_out		 <= '0; 
		rs1_out		 <= '0; 
		rs2_out		 <= '0; 
		bu_cond_out	 <= '0; 
		bu_target_out<= '0; 
                       	   
	end
	else if (EN && HZ_en) begin
		// Control signals
		EXctrl_out  <= EXctrl_in;
		MEMctrl_out <= MEMctrl_in;
		WBctrl_out 	<= WBctrl_in;

		// Data signals
		pc_out		 <= pc_in;        
		imm_out		 <= imm_in;       
		rs1_data_out <= rs1_data_in;  
		rs2_data_out <= rs2_data_in;  
		rd_out		 <= rd_in;        
		rs1_out		 <= rs1_in;       
		rs2_out		 <= rs2_in;       
		bu_cond_out	 <= bu_cond_in;  
		bu_target_out<= bu_target_in;
	end
	
end

endmodule
