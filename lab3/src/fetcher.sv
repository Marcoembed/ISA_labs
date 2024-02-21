/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: FETCHER
// Project Name: risc-v 
//
// Description:
// This module acts as an interface between the risc-v core and the external memory.
// A finite state machine (FSM) is implemented to handle the task.
// The fetcher recieves a signal from the Hazard unit whenever a new instruction 
// needs to be read. Then, it issues a request to the memory, using the PC
// as address. When the instruction is received correctly, the fetcher provides it to 
// the core. Meanwhile an output signal (busy_out) reports the current status to the HU.
// 
/*--------------------------------------------------------------------------------------*/


module fetcher import riscv_pkg::*;
(
	input logic	CLK,
	input logic	RSTn,

	// control signals
	input  logic HZ_instr_req,
	output logic busy_out,

	// processor signals
	input  logic [31:0] PC_in,
	output logic [31:0] INSTR_out,

	// memory signals
	obi_intf.to_mem fetch_intf

);


// Custom states for the FSM
typedef enum logic[1:0] {wait_req, wait_valid, wait_ready} state;
state current_state, next_state;


// State evolution process
always_ff @(posedge CLK) begin
	if (!RSTn) begin
		current_state <= wait_req;
	end
	else begin
		current_state <= next_state;
	end
end


// Nex state generation process
always_comb begin : fetcher_fsm_control
	next_state = current_state;
	
	case (current_state)
		wait_req: begin
			if (HZ_instr_req) begin
				if (fetch_intf.mem_rdy == '1) begin
					next_state = wait_valid;
				end else begin
					next_state = wait_ready;
				end
			end
		end

		wait_ready: begin
			if (fetch_intf.mem_rdy == '1) begin
				next_state = wait_valid;
			end
		end

		wait_valid: begin
			if (fetch_intf.valid == '1) begin
				next_state = wait_req;
			end
		end

		default: begin
			next_state = current_state;
		end
	endcase

end

// Output generation process (Mealy)
always_comb begin : fetcher_fsm_data

	busy_out = '0;
	fetch_intf.proc_req = NOREQUEST;

	case (current_state)
		wait_req: begin
			if (HZ_instr_req) begin
				busy_out = '1;
				fetch_intf.proc_req = REQUEST;
			end 
		end

		wait_ready: begin
			busy_out = '1;
			fetch_intf.proc_req = REQUEST;
		end

		wait_valid: begin
			busy_out = '1;
			if(fetch_intf.valid ) begin
				busy_out = '0;
			end
		end
	endcase

end

// direct connections
assign fetch_intf.addr = PC_in;
assign fetch_intf.we = READ;
assign fetch_intf.wdata = '0;

// RDATA kept stable
always_latch begin : rdata_latch
	if (fetch_intf.valid) begin
		INSTR_out <= fetch_intf.rdata;  
	end
end

endmodule