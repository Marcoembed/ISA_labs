/*--------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Register File
// Project Name: risc-v 
//
// Description:
// The Register File (RF) is composed by 32 registers, each one with the parallelism of
// a word. Except for the first one (that always contains zero), they are all identical
// from an hardware point of view. However, each of them is commonly related to specific
// tasks, such as containing the stack pointer or the return address. Hence a symbolic
// name is used. For example regs[2] is called "sp" while regs[10] is known as "a0".
// 
// The RF performs 2 operations:
// - READ: the content of 2 registers at the same time is combinationally shown
// - WRITE: an input data is written into a specified register if, during the rising
//          edge of the clock, a write enable signal is asserted.
// 
// The RF also features a synchronous negative logic reset signal to clear its content.
// 
/*--------------------------------------------------------------------------------------*/


module register_file import riscv_pkg::*;
(
	input logic [4:0] rs1,
	input logic [4:0] rs2,
	input logic [4:0] rd,
	input logic [31:0] write_data,

	input logic RSTn, // needed to reset all registers
	input logic clk,
	input RF_wr WE,	
	
	output logic [31:0] read_data1,
	output logic [31:0] read_data2
);

	// 32 registers of 32 bits each
	logic [31:0] regs[32];


	// This register file is synchronous
	always_ff @(posedge clk) begin
		if (RSTn == 0) begin
			for (int i = 0; i < 32; i = i + 1) begin
				regs[i] <= 32'b0;
			end
		end else if (WE == WR) begin
			if (rd != 0) begin
				regs[rd] <= write_data;
			end

		end
	end

	// Combinational statements for the output read values
	assign read_data1 = regs[rs1];
	assign read_data2 = regs[rs2];

endmodule
