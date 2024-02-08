/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it,
// 								 simoneruffini.work@gmail.com],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: risc-v Datapath
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

module riscv_core import riscv_pkg::*;
( 
    input logic CLK,
    input logic EN,
    input logic RSTn
);

/*------------------------------*/
//  SIGNALS
/*------------------------------*/

// ------------------------------ PIPE REGISTERS
HAZARD_ctrl PC_REG;
PREG IF_DEC, DEC_EX, EX_MEM, MEM_WB;

// ------------------------------ HAZARD signals TODO: check if use a struct
logic HZ_instr_req_core; // request fired
logic HZ_data_req_core; // request fired
logic instr_mux_sel_core;
// ------------------------------ FORWARDING signals
FU_data FUdata_core;
FU_mux  FUmux_core;

// ------------------------------ BRANCH signals
IF_ctrl BRANCH_COND_core;
logic [width-1:0] BRANCH_DATA_core;

// ------------------------------ FETCH signals
logic [width-1:0] PC_core;

// ------------------------------ FETCHER signals
logic [width-1:0] INSTR_core;
logic INSTR_valid_core;

// ------------------------------ DECODE signals
DEC_ctrl BRANCH_op_core;
// ------------------------------ EXECUTE signals



/*------------------------------*/
//	HAZARD
/*------------------------------*/

hu hazard_unit (
    // input
	.EN(EN),
	.BRANCH_cond_in(BRANCH_COND_core),
	.INSTR_mem_busy_in(INSTR_valid_core),
	.DATA_mem_bus_in(DATA_valid_core),
	.MEMctrl_in(EX_MEM.MEMctrl_out),
	.EX_MEM_RD_in(EX_MEM.RD_out),
	.DEC_EX_RS1_in(DEC_EX.RS1_out),
	.DEC_EX_RS2_in(DEC_EX.RS2_out),
	// output
	.PC_REG_out(PC_REG),
	.IF_DEC_out(IF_DEC.HZctrl_in),
	.DEC_EX_out(DEC_EX.HZctrl_in),
	.EX_MEM_out(EX_MEM.HZctrl_in),
	.MEM_WB_out(MEM_WB.HZctrl_in),
	.HZ_instr_req(HZ_instr_req_core), // request fired
	.HZ_data_req(HZ_data_req_core), // request fired
	.instr_mux_sel(instr_mux_sel_core)

);

cu control_unit (
    // input
    .instr(INSTR_core), 
    .FLUSH_IF_DEC(IF_DEC.HZctrl_in),
    // output
    .DEC(BRANCH_op_core),
    .EX(DEC_EX.EXctrl_in),
    .MEM(DEC_EX.MEMctrl_in),
    .WB(DEC_EX.WBctrl_in)
);

fu forwarding_unit (
    // input
    .FU_in(FUctrl_core),
    // output
    .FU_out(FUmux_core)
);

/*------------------------------*/
//	PIPE REGISTERS
/*------------------------------*/

// ------------------------------ FETCH-DECODE PIPE REGISTER
always_ff @( posedge CLK ) begin : if_dec

	if (RSTn == 0 || IF_DEC.HZctrl_in == FLUSH) begin

		// Data signals
		IF_DEC.PC_out    <= '0; 
        IF_DEC.INSTR_out <= '0;

	end	else if (IF_DEC.HZctrl_in == ENABLE) begin
		// Data signals
		IF_DEC.PC_out    <= PC_core; 
        IF_DEC.INSTR_out <= INSTR_core;
	end

end

// ------------------------------ DECODE-EXECUTE PIPE REGISTER
always_ff @( posedge CLK ) begin : dex_ex

	if (RSTn == 0 || DEC_EX.HZctrl_in == FLUSH) begin

		// Control signals
		DEC_EX.EXctrl_out  <= '0;
		DEC_EX.MEMctrl_out <= '0;  		// '0 takes care about size based on context		
		DEC_EX.WBctrl_out 	<= '0;

		// Data signals
		DEC_EX.PC_out		 <= '0; 
		DEC_EX.IMM_out		 <= '0; 
		DEC_EX.RS1_DATA_out <= '0; 
		DEC_EX.RS2_DATA_out <= '0; 
		DEC_EX.RD_out		 <= '0; 
		DEC_EX.RS1_out		 <= '0; 
		DEC_EX.RS2_out		 <= '0; 
		DEC_EX.BU_COND_out	 <= '0; 
		DEC_EX.BU_TARGET_out<= '0; 
        
                       	   
	end
	else if (DEC_EX.HZctrl_in == ENABLE) begin
		// Control signals
		DEC_EX.EXctrl_out  <= DEC_EX.EXctrl_in;
		DEC_EX.MEMctrl_out <= DEC_EX.MEMctrl_in;
		DEC_EX.WBctrl_out  <= DEC_EX.WBctrl_in;

		// Data signals
		DEC_EX.PC_out        <= DEC_EX.PC_in;        
		DEC_EX.IMM_out       <= DEC_EX.IMM_in;       
		DEC_EX.RS1_data_out  <= DEC_EX.RS1_data_in;  
		DEC_EX.RS2_data_out  <= DEC_EX.RS2_data_in;  
		DEC_EX.RD_out        <= DEC_EX.RD_in;        
		DEC_EX.RS1_out       <= DEC_EX.RS1_in;       
		DEC_EX.RS2_out       <= DEC_EX.RS2_in;       
		DEC_EX.BU_cond_out   <= DEC_EX.BU_cond_in;  
		DEC_EX.BU_target_out <= DEC_EX.BU_target_in;
	end
	
end

// ------------------------------ EXECUTE-MEMORY PIPE REGISTER
always_ff @( posedge CLK ) begin : ex_mem

	if (RSTn == 0 || EX_MEM.HZctrl_in == FLUSH) begin

		// Control signals
		EX_MEM.MEMctrl_out <= '0;
		EX_MEM.WBctrl_out  <= '0;

		// Data signals
		EX_MEM.IMM_out      <= '0; 
		EX_MEM.RES_alu_out  <= '0; 
		EX_MEM.RS2_data_out <= '0; 
		EX_MEM.RD_out       <= '0; 
                       	   
	end	else if (EX_MEM.HZctrl_in == ENABLE) begin

		// Control signals
		EX_MEM.MEMctrl_out <= EX_MEM.MEMctrl_in;
		EX_MEM.WBctrl_out  <= EX_MEM.WBctrl_in;

		// Data signals
		EX_MEM.IMM_out      <= EX_MEM.IMM_in;      
		EX_MEM.RES_alu_out  <= EX_MEM.RES_alu_in;  
		EX_MEM.RS2_data_out <= EX_MEM.RS2_data_in; 
		EX_MEM.RD_out       <= EX_MEM.RD_in;       // (DEC_reg out?? )
	end
	
end

// ------------------------------ MEMORY-WRITEBACK PIPE REGISTER
always_ff @( posedge CLK ) begin : mem_wb

	if (RSTn == 0 || MEM_WB.HZctrl_in == FLUSH) begin

		// Control signals
		MEM_WB.WBctrl_out 	<= '0;

		// Data signals
		MEM_WB.IMM_out		 <= '0; 
		MEM_WB.RES_alu_out	 <= '0; 
		MEM_WB.DATA_mem_out	 <= '0; 
		MEM_WB.RD_out       <= '0; 
                       	   
	end	else if (MEM_WB.HZctrl_in == ENABLE) begin

		// Control signals
		MEM_WB.WBctrl_out 	<= MEM_WB.WBctrl_in;

		// Data signals
		MEM_WB.IMM_out		 <= MEM_WB.IMM_in; 
		MEM_WB.RES_alu_out	 <= MEM_WB.RES_alu_out; 
		MEM_WB.DATA_mem_out	 <= MEM_WB.DATA_mem_out; 
		MEM_WB.RD_out        <= MEM_WB.RD_out; 
	end

	
end
/*------------------------------*/
//	FETCH
/*------------------------------*/


fet fetch (
    .CLK(CLK),
    .RSTn(RSTn),
    .EN(EN),
    .HZctrl_in(HZ_PC_REG_core),
    .BRANCH_cond_in(BRANCH_COND_core),
    .BRANCH_in(BRANCH_DATA_core),
    .PC_in(PC_core),
    .PC_out(PC_core)
);

/*------------------------------*/
//	DECODE
/*------------------------------*/
dec decode (
	.CLK(CLK),
    .RSTn(RSTn),
    .EN(EN),

	//input
	.DECctrl_in(BRANCH_op_core), 
	.IDdata_INSTRUCTION_in(IF_DEC.INSTR_out),
	.IDdata_PC_in(IF_DEC.PC_out),
	.WBdata_RD_in(), //TODO
	.WBdata_WriteData_in(), //TODO

	//output
	.EXdata_PC_out(DEC_EX.PC_out),
	.EXdata_IMM_out(DEC_EX.IMM_out),
	.EXdata_RS1_out(DEC_EX.RS1_data_out),
	.EXdata_RS2_out(DEC_EX.RS2_data_out),
	.EXdata_RD_out(DEC_EX.RD_out),
	.IFctrl_out(BRANCH_COND_core) 


);
/*------------------------------*/
//	EXECUTE
/*------------------------------*/
exe execute(

    .EXctrl_in(DEC_EX.EXctrl_out),
	.FUctrl_in(FUmux_core),
    
	// TODO non dovrebbe servire perchè è in EX_ctrl
	.ALUctrl_in(),

	//input
    .EXdata_FRWDALU_in(EX_MEM.RES_alu_out), //TODO controllare se sono giusti
    .EXdata_FRWDWB_in(), //TODO
	.EXdata_PC_in(DEC_EX.PC_out),
 	.EXdata_IMM_in(DEC_EX.IMM_out),
 	.EXdata_RS1_in(DEC_EX.RS1_out),
 	.EXdata_RS2_in(DEC_EX.RS2_out),

	//output
 	.EXdata_ALU_out(RES_alu_in),
    .EXdata_IMM_out(IMM_in)


);
/*------------------------------*/
//  MEMORY
/*------------------------------*/
lsu load_store_unit(
    // control signals
    .CLK(CLK),
    .RSTn(RSTn),
    .MEMctrl_in(EX_MEM.MEMctrl_out),
    .HZ_data_req(HZ_data_req_core),

    // from datapath
    .addr_in(EX_MEM.RES_alu_out),
    .data_in(EX_MEM.IMM_out),

    // to datapath
   .data_out(MEM_WB.DATA_mem_out),

    // to obi interface
    .OBI_addr(),
    .OBI_data_out(),  // data to be sent on obi interface
    .OBI_proc_req(),
    .OBI_we(), //we-nRE

    // from obi interface 
    .OBI_data_in(), // data sampled from the obi interface
    .OBI_mem_rdy(),
    .OBI_valid(),

    // to hazard unit
    .busy_out()

);
/*------------------------------*/
//	WRITEBACK
/*------------------------------*/

endmodule




