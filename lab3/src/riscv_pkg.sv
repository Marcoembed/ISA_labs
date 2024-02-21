/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: RISC-V package
// Project Name: risc-v 
//
// Description:
// The RISC-V package contains all useful constant parameters adopted troughout the project.
// Constant codes such as the OPCODE values or the status of control signals are 
// defined inside the package.
// Also, custom structures have been defined to provide a standard when routing signals
// between blocks. For example "EX_ctrl" is a cluster of signals directed to the execution
// stage. Inside the stage, it is splitted to control the ALU and its input multiplexers.
// 
/*--------------------------------------------------------------------------------------*/


package riscv_pkg;
	// param
	localparam width = 32;
	localparam reg_width = 5;
	localparam opcode_width = 5;

	typedef enum logic [6:0] {
		OP_RTYPE	= 7'b0110011,
		OP_ADDI		= 7'b0010011,
		OP_AUIPC	= 7'b0010111,
		OP_BRANCH	= 7'b1100011,
		OP_JMP		= 7'b1101111,
		OP_LUI		= 7'b0110111,
		OP_LW		= 7'b0000011,
		OP_SW		= 7'b0100011,
		OP_RET		= 7'b1100111
	} t_opcode;

	//------------------------------ FORWARD
	typedef struct packed {
		logic [4:0]		Mem_rd;
		logic [4:0]		WB_rd;
		logic [4:0]		EX_rs1;
		logic [4:0]		EX_rs2;
		logic			Mem_RegWrite;
		logic			WB_RegWrite;
		logic			ALU_srcA;
		logic			ALU_srcB;
//		logic			MEM_in_Rd_EQ0;
//		logic			WB_in_Rd_EQ0;
	} FU_data;


	typedef enum logic [1:0] {
		FORWARD_alu,
		FORWARD_wb,
		NOFORWARD
	} FU_ctrl;

	typedef struct packed {
		FU_ctrl FRWD_A;
		FU_ctrl FRWD_B;
	} FU_mux;

	//------------------------------ HAZARD

	typedef enum logic[1:0] {
		ENABLE,
		FLUSH,
		STALL
	} HAZARD_ctrl;

	typedef enum logic[1:0] {
		BRANCH,
		JMP,
		NOBRANCH,
		RET
	} BRANCH_ctrl;


	//------------------------------ OBI interface


	typedef enum logic {
		READ,
		WRITE
	} rdwr;

	typedef enum logic {
		NOREQUEST,
		REQUEST
	} obi_req;

	typedef struct {
		rdwr we;
		obi_req proc_req;
		logic valid;
		logic mem_rdy;
		logic [width-1:0] wdata;
		logic [width-1:0] rdata;
		logic [reg_width-1:0] addr;
	} obi;


	//------------------------------ ALU Operations
	typedef enum logic [6:0] {
		// Arithmetics
		ADD = 7'b0000000,
		SUB = 7'b0100000
	} t_funct7;

	typedef enum logic [2:0] {
		// Arithmetics
		BLE  = 3'b101,
		BLTU = 3'b110
	} t_funct3;

	typedef enum logic [1:0] {
		ALU_ADD,
		ALU_SUB,
		ALU_NOP
	} ALU_ctrl;

	typedef enum logic {
		RS1,
		PC
	} ALU_srcA;

	typedef enum logic {
		IMM,
		RS2
	} ALU_srcB;

	/*------------------------------*/
	//	FET
	/*------------------------------*/
	typedef enum logic {
		NOJUMP,
		JUMP
	} IF_ctrl;
	
	/*------------------------------*/
	//	DEC
	/*------------------------------*/

	typedef struct packed {
		BRANCH_ctrl branch;
	} DEC_ctrl;

	/*------------------------------*/
	//	EXE
	/*------------------------------*/

	typedef struct packed {
		ALU_ctrl ALUopr;
		ALU_srcA ALUsrcA;
		ALU_srcB ALUsrcB;
	} EX_ctrl;

	/*------------------------------*/
	//	MEM
	/*------------------------------*/

	typedef struct packed {
		logic mem_en;
		rdwr wr;
	} MEM_ctrl;
	
	/*------------------------------*/
	//	WB
	/*------------------------------*/
	typedef enum logic [1:0]{
		ALUtoRF,
		MEMtoRF,
		IMMtoRF,
		NPCtoRF
	} WB_mux;

	typedef enum logic {
		NOWR,
		WR
	} RF_wr;

	typedef struct packed {
		RF_wr RF_we;
		WB_mux SRCtoRF;
	} WB_ctrl;


	//------------------------------ WB
	
	//------------------------------ PIPE REGISTERS
	typedef struct {
		
	// control input signals
		EX_ctrl		EXctrl_in;
		MEM_ctrl	MEMctrl_in;
		WB_ctrl		WBctrl_in;
		HAZARD_ctrl HZctrl_in;

	// control output signals
		MEM_ctrl	MEMctrl_out;
		WB_ctrl		WBctrl_out;
		EX_ctrl		EXctrl_out;

	// data input signals
		logic [width-1:0] NPC_in, PC_in, INSTR_in, IMM_in, RS1_data_in, RS2_data_in, RES_alu_in, BU_target_in, DATA_mem_in;
		logic [reg_width-1:0] RD_in, RS1_in, RS2_in; 
		IF_ctrl BU_cond_in;

	// data output signals
		logic [width-1:0] NPC_out, PC_out, INSTR_out, IMM_out, RS1_data_out, RS2_data_out, RES_alu_out, BU_target_out, DATA_mem_out;
		logic [reg_width-1:0] RD_out, RS1_out, RS2_out; 
		IF_ctrl BU_cond_out;
	} PREG;

	//------------------------------ OPCODE

endpackage