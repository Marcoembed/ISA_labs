package riscv_pkg;
	//------------------------------ OPCODE
	typedef enum logic [6:0] {
		OP_RTYPE 	= 7'b0110011,
		OP_ADDI 	= 7'b0010011,
		OP_AUIPC	= 7'b0010111,
		OP_BRANCH	= 7'b1100011,
		OP_JMP		= 7'b1101111,
		OP_LUI		= 7'b0110111,
		OP_LW		= 7'b0000011,
		OP_SW		= 7'b0100011,
		OP_RET		= 7'b1100111
	} t_opcode;

	//------------------------------ INSTRUCTIONS
	
	typedef enum logic [31:0] {
		ADD,
		ADDI,
		AUIPC,
		BLE,
		BLTU,
		J,
		JAL,
		LI,
		LUI,
		LW,
		MV,
		NOP,
		RET,
		SUB,
		SW
	} inst_enum;

	//------------------------------ FORWARD
	typedef enum logic [2:0] {
		FORWARD_alu,
		FORWARD_wb,
		NOFORWARD
	} fu_ctrl;	

	//------------------------------ HAZARD


	//------------------------------ OBI interface
	typedef struct packed {
		logic proc_req;
		logic mem_rdy;
		logic valid;
		logic we;		// write / (read')
	} obi_ctrl;

	
	//------------------------------ ALU Operations
	typedef enum logic [6:0] {
    	// Arithmetics
    	ADD = 7'b0000000,
    	SUB = 7'b0100000
	} funct7;

	typedef enum logic [6:0] {
    	// Arithmetics
    	ADD = 7'b0000000,
    	SUB = 7'b0100000
	} funct3;

	typedef enum logic {
		ALU_ADD = 1'b0,
		ALU_SUB = 1'b1
	}ALU_ctrl;

	typedef enum logic {
		PC,
		RS1, 
		RS2, 
		IMM 
	}ALU_src;
	
	/*------------------------------*/
	//	DEC
	/*------------------------------*/

	/*------------------------------*/
	//	EXE
	/*------------------------------*/

	typedef struct packed {
		ALU_ctrl ALUopr;
		ALU_src ALUsrcA;
		ALU_src ALUsrcB;
	}EX_ctrl;

	/*------------------------------*/
	//	MEM
	/*------------------------------*/

	typedef struct packed {
		obi_ctrl obi;
	}MEM_ctrl;
	
	/*------------------------------*/
	//	WB
	/*------------------------------*/
	typedef struct packed {
		logic SRCtoRF;
	}WB_ctrl;

	typedef enum logic{
		MEMtoRF,
		ALUtoRF
	}WB_mux;

	//------------------------------ WB
	
	
endpackage


