/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Load and Store Unit
// Project Name: risc-v 
//
// Description:
// This module acts as an interface between the risc-v core and the external memory.
// A finite state machine (FSM) is implemented to handle the task.
// The LSU recieves a signal from the Hazard Unit whenever a new instruction can be
// requested. If the Control Word from the CU is related to an actual read/write 
// operation, the LSU issues a request to the memory using the previous result of the 
// ALU as an address. When data is received correctly, the LSU provides it to the core.
// Meanwhile an output signal (busy_out) reports the current status to the HU.
// 
/*--------------------------------------------------------------------------------------*/


module lsu import riscv_pkg::*;
(
	input logic CLK,
	input logic RSTn,

	// control signals
	input logic HZ_data_req,
	output logic busy_out,
	input MEM_ctrl MEMctrl_in,

	// processor signals
	input logic [31:0] addr_in,
	input logic [31:0] data_in,
	output logic [31:0] data_out,

	// memory signals
	obi_intf.to_mem lsu_intf

);


typedef enum logic[1:0] {wait_req, wait_valid, wait_ready} state;
state current_state, next_state;

always_ff @(posedge CLK) begin
	if (!RSTn) begin
		current_state <= wait_req;
	end
	else begin
		current_state <= next_state;
	end
end

always_comb begin : lsu_fsm_control

	next_state = current_state;

	case (current_state)
		wait_req: begin
			if (MEMctrl_in.mem_en == '1 && HZ_data_req) begin
				if (lsu_intf.mem_rdy == '1) begin
					next_state = wait_valid;
				end else begin
					next_state = wait_ready;
				end
			end
		end

		wait_ready: begin
			if (lsu_intf.mem_rdy == '1) begin
				next_state = wait_valid;
			end
		end

		wait_valid: begin
			if (lsu_intf.valid == '1) begin
				next_state = wait_req;
			end
		end

		default: begin
			next_state = current_state;
		end
	endcase

end


always_comb begin : lsu_fsm_output

	busy_out = '0;
	lsu_intf.proc_req = NOREQUEST;

	case (current_state)
		wait_req: begin
			if (MEMctrl_in.mem_en == '1 && HZ_data_req) begin
				busy_out = '1;
				lsu_intf.proc_req = REQUEST;
			end 
		end

		wait_ready: begin
			busy_out = '1;
			lsu_intf.proc_req = REQUEST;
		end

		wait_valid: begin
			busy_out = '1;
			if(lsu_intf.valid == '1) begin
				busy_out = '0;
			end
		end
	endcase

end

// direct connections
assign lsu_intf.addr = addr_in;
assign lsu_intf.we = MEMctrl_in.wr;
assign lsu_intf.wdata = data_in;

// RDATA kept stable
always_latch begin : rdata_latch
	if (lsu_intf.valid) begin
		data_out <= lsu_intf.rdata;  
	end
end

endmodule