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

module register_file 
(
	input logic [4:0] rs1, // The register number from instruction is always 5 bits
	input logic [4:0] rs2,
	input logic [4:0] rd,
	input logic [31:0] write_data,
	input logic RegWrite,
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
		if (RSTn == 0)begin
			for (i = 0; i < 32; i = i + 1) begin
				regs[i] = 32'b0
			end
		end
		if (EN_i) begin
			if (writeAddr == 5'b00000)
				regs[writeAddr] = 32'b0
			else
				regs[writeAddr] <= writeData;
		end
	end

	assign readData1 = regs[readAddr1];
	assign readData2 = regs[readAddr2];

endmodule
