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


	//------------------------------ FORWARD
	typedef enum logic [2:0] {
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
		BRANCH,
		JMP,
		NOBRANCH
	} BRANCH_ctrl;


	//------------------------------ OBI interface
	typedef struct packed {
		logic proc_req;
		logic mem_rdy;
		logic valid;
		logic we;		// write / (read')
	} OBI_ctrl;

	
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

	typedef enum logic {
		ALU_ADD = 1'b0,
		ALU_SUB = 1'b1
	}ALU_ctrl;

	typedef enum logic {
		RS1, 
		PC
	}ALU_srcA;

	typedef enum logic {
		RS2, 
		IMM 
	}ALU_srcB;
	
	/*------------------------------*/
	//	DEC
	/*------------------------------*/

	typedef struct packed {
		BRANCH_ctrl branch;
	}DEC_ctrl;

	/*------------------------------*/
	//	EXE
	/*------------------------------*/

	typedef struct packed {
		ALU_ctrl ALUopr;
		ALU_srcA ALUsrcA;
		ALU_srcB ALUsrcB;
	}EX_ctrl;

	/*------------------------------*/
	//	MEM
	/*------------------------------*/

	typedef struct packed {
		OBI_ctrl obi;
	}MEM_ctrl;
	
	/*------------------------------*/
	//	WB
	/*------------------------------*/
	typedef enum logic [1:0]{
		MEMtoRF,
		ALUtoRF,
		IMMtoRF
	}WB_mux;

	typedef struct packed {
		WB_mux SRCtoRF;
	}WB_ctrl;


	//------------------------------ WB
	
	
endpackage


