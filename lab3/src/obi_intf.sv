/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: OBI interface
// Project Name: risc-v 
//
// Description:
// The OBI interface provides a standard of input and output signals that can be used to
// connect devices implementing the req/rdy/valid protocol. Other than this control bits,
// the interface include data buses to carry the address and data for separate read
// and write operations.
// The direction of signals can be selected between 2 predefined modport configurations:
// - one to interface the processor towards the memory
// - one to interface the memory towards the processor
//
/*--------------------------------------------------------------------------------------*/


interface obi_intf;
	import riscv_pkg::*;

	obi_req proc_req;
	logic mem_rdy;
	rdwr we;
	logic [31:0] addr;
	logic [31:0] wdata;
	logic [31:0] rdata;
	logic valid;


	// processor to memory
	modport to_mem (
		output proc_req, we, addr, wdata,	// to memory
		input mem_rdy, valid, rdata			// from memory
	);

	// memory to processor
	modport to_proc (
		input proc_req, we, addr, wdata,	// to memory
		output mem_rdy, valid, rdata		// from memory
	);

endinterface