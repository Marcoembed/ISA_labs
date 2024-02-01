/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Register File
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

module register_file import riscv_pkg::*;
(
	input logic [4:0] rs1, // The register number from instruction is always 5 bits
	input logic [4:0] rs2,
	input logic [4:0] rd,
	input logic [31:0] write_data,
//	input logic RegWrite,
	input logic RSTn, // this is needed to reset all the register
	input logic clk,
	input logic en,	
	
	output logic [31:0] read_data1,
	output logic [31:0] read_data2
);

// The number of register is equal to 32. So we need at least 32 flip flops.
// This register file is asynchronous

	logic [31:0] regs[32];

	always_ff @(posedge clk) begin
		if (RSTn == 0) begin
			for (int i = 0; i < 32; i = i + 1) begin
				regs[i] <= 32'b0;
			end
		end else if (en) begin
			if (rd == 0) begin
			  regs[rd] <= 32'b0;
			end else begin
				regs[rd] <= write_data;
			end

		end
	end

	assign read_data1 = regs[rs1];
	assign read_data2 = regs[rs2];

endmodule
