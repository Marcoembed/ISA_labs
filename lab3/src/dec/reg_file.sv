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
	input wire [4:0] rs1, // The register number from instruction is always 5 bits
	input wire [4:0] rs2,
	input wire [4:0] rd,
	input wire [31:0] write_data,
	input wire RegWrite,
	input wire RSTn, // this is needed to reset all the register
	input wire clk,
	input wire en,	
	
	output reg [31:0] read_data1,
	output reg [31:0] read_data2
);

// The number of register is equal to 32. So we need at least 32 flip flops.
// This register file is asynchronous
	reg EN_i[32];
	reg [31:0] Q_o[32];
	genvar gen;
	integer i;

	generate
		for (gen = 1; gen < 32; gen = gen + 1) begin
			flip_flop ff0 (
				.d(write_data), 
				.rstn(RSTn), 
				.clk(clk),
				.en(EN_i[gen] & en),	
				.q(Q_o[gen]));
		end
	endgenerate
	
	/* MUX IN WRITE */
	always_comb begin
		for (i = 1; i < 32; i = i+1) begin
			if (i == rd) begin
				EN_i[i] = RegWrite;
			end
			else
				EN_i[i] = 1'b0;
		end	
	end
	
	always_comb begin
		if (rs1 == 5'b00000)
			read_data1 = 32'b0;
		else
			read_data1 = Q_o[rs1];
	end
	
	always_comb begin
		if (rs2 == 5'b00000)
			read_data2 = 32'b0;
		else
			read_data2 = Q_o[rs2];
	end
endmodule
