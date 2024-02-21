/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: SSRAM wrapping module
// Project Name: risc-v 
//
// Description:
// This module interfaces with the processor via the OBI protocol and control signals.
// On the other hand, it deals with the specific SSRAMs chosen for the design.
// In this case, the memory is always ready, and the wrap module asserts the valid
// signal one clock cycle after an incoming read / write request.
// The address is also manipulated to take into account the fact that the destination
// memory is organized by 32-bit cells and it's only word addressable.
//
/*--------------------------------------------------------------------------------------*/


module ssram_wrap import riscv_pkg::*;
(
	input	logic CLK_in,
	input	logic RSTn_in,

	// SSRAM signals
	output	logic csb,
	output	logic web,
	output	logic [ 9:0] addr,
	input	logic [31:0] dout,
	output	logic [31:0] din,

	// processor signals
	obi_intf.to_proc obi_intf_in
);


	always_comb begin

		csb = !obi_intf_in.proc_req;
		web = !obi_intf_in.we;
		addr = {2'b0, obi_intf_in.addr[9:2]};
		din = obi_intf_in.wdata;

		obi_intf_in.mem_rdy = '1;
		obi_intf_in.rdata = dout;

	end



	always_ff @(posedge CLK_in) begin

		if (!RSTn_in) begin
			obi_intf_in.valid <= '0;
		end
		else begin
			obi_intf_in.valid <= obi_intf_in.proc_req;
		end

	end

endmodule