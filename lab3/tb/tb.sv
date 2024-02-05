`timescale 1 ns / 1 ps
module DP_TB ();	
	reg 		TB_LOAD_PROGRAM_CTRL;
	reg [9:0]  	TB_LOAD_PROGRAM_ADDR;
	reg [31:0] 	TB_LOAD_PROGRAM_DATA;
	
	reg 		TB_LOAD_DATA_CTRL;
	reg [9:0]  	TB_LOAD_DATA_ADDR;
	reg [31:0] 	TB_LOAD_DATA_DATA;
	
	reg CLK;
	reg RSTn;
	reg EN;
	reg START;
	
	reg OK;
	
	DataPath DP_uut(
	  .TB_LOAD_PROGRAM_CTRL (TB_LOAD_PROGRAM_CTRL),
	  .TB_LOAD_PROGRAM_ADDR (TB_LOAD_PROGRAM_ADDR),
	  .TB_LOAD_PROGRAM_DATA (TB_LOAD_PROGRAM_DATA),
	  .TB_LOAD_DATA_CTRL    (TB_LOAD_DATA_CTRL   ),
	  .TB_LOAD_DATA_ADDR    (TB_LOAD_DATA_ADDR   ),
	  .TB_LOAD_DATA_DATA    (TB_LOAD_DATA_DATA   ),
	  .CLK                  (CLK                 ),
	  .EN                   (EN                  ),
	  .START				(START				 ),
	  .RSTn                 (RSTn                ),
	  .OK					(OK					 ),
	  .TB_Instr				(					 )	  
	);

	integer instr_file;
	integer instr_toload[200];
	integer instr_cnt = 0;
	
	integer data_file;
	integer data_toload[200];
	integer data_cnt = 0;

	initial begin
		RSTn = 1'b1;					// Resetting the architecture while loading data 
		#1
		RSTn = 1'b0;					// Resetting the architecture while loading data
		EN = 1'b0; 						// Disable the whole architecture
		START = 1'b0;
		TB_LOAD_PROGRAM_CTRL =	1'b1; 	// Starting INSTR programming procedure 
		TB_LOAD_DATA_CTRL =	1'b0; 		// Disabling DATA programming procedure 
										// and instr memory
		
		instr_file = $fopen("./main_hex.txt", "r");
		if (!instr_file) begin
				$display("Error while opening instruction file");
				$stop;
		end 
			
		while (!$feof(instr_file)) begin
			$fscanf(instr_file, "%h\n", instr_toload[instr_cnt]);
			instr_cnt = instr_cnt + 1;
		end
		
		data_file = $fopen("./data_hex.txt", "r");
		if (!data_file) begin
				$display("Error while opening data file");
				$stop;
		end 
			
		while (!$feof(data_file)) begin
			$fscanf(data_file, "%h\n", data_toload[data_cnt]);
			data_cnt = data_cnt + 1;
		end

		CLK = 1'b0;
	end

	integer instr_load_finish = 0;
	integer instr_address = 0;	
	
	integer data_load_finish = 0;
	integer data_address = 0;
	
	integer CLK_Count = 0;	
	integer CLK_Count1 = 0;	

	integer TB_CLOCK = 0.54;
	
	always begin
		if (data_load_finish == 0) begin
			#TB_CLOCK; CLK = ~CLK;
		end else begin
			#0.54; CLK = ~CLK;
			if (OK == 1'b1) begin
				$display("The total numer of clock rising edges is %d", CLK_Count);
				$display("The total amount of instruction is 69, ALU: 43, Jump: 3, Branch: 13, Memory: 10");
				$display("The CPI\t is %f", shortreal'(CLK_Count)/69);
				$display("The CPI1\t is %f", shortreal'(CLK_Count1)/69);
				$stop;
			end
		end
	end

	always @ (posedge CLK) begin
		if (instr_address < instr_cnt) begin
			TB_LOAD_PROGRAM_ADDR = instr_address;
			TB_LOAD_PROGRAM_DATA = instr_toload[instr_address];
			instr_address = instr_address + 1;
		end	else begin
				TB_LOAD_PROGRAM_CTRL = 1'b0;
				instr_load_finish = 1;
				$fclose(instr_file);
		end

		if (instr_load_finish == 1) begin
			if (data_address < data_cnt) begin
				TB_LOAD_DATA_ADDR = data_address;
				TB_LOAD_DATA_DATA = data_toload[data_address];
				TB_LOAD_DATA_CTRL = 1'b1;
				data_address = data_address + 1;
			end	else begin
					TB_LOAD_DATA_CTRL = 1'b0;
					data_load_finish = 1;
					$fclose(data_file);
					#(TB_CLOCK)
					RSTn = 1'b1;
					EN = 1'b1;
					START = 1'b1;
			end	
		end

		if (data_load_finish == 1) begin
			CLK_Count = CLK_Count + 1;
			//if (DP_uut.FE0.I_FSM0.current_state == IDLE || DP_uut.FE0.I_FSM0.current_state == MEMREAD) begin
			//	CLK_Count1 = CLK_Count1 + 1;
			//end
		end

	end
	
endmodule