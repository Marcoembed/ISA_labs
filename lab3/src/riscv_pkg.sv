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
    	FUNC_ADD = 7'b0000000,
    	FUNC_SUB = 7'b0100000
	} func7;

	typedef enum logic {
		ALU_ADD = 1'b0,
		ALU_SUB = 1'b1
	}ALU_ctrl;

	typedef enum logic {
		OPB = 1'b0,
		IMM = 1'b1
	}ALU_src;
	
	/*------------------------------*/
	//	DEC
	/*------------------------------*/

	/*------------------------------*/
	//	EXE
	/*------------------------------*/


	typedef struct packed {
		ALU_ctrl ALUopr;
		ALU_src ALUsrc;
		inst_type is_RTYPE;
	}EX_ctrl;

	typedef enum logic{
		NORTYPE = 1'b0,
		RTYPE = 1'b1
	}inst_type;

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


