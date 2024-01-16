/*----------------------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name:		Booth (Modified radix 4 Booth Encoder)
// Project Name:	BOOTH
// Description:		This module works on triplets of bits of multiplicand B
//					so that each partial product for the multiplication is selected
//					in a multiplexer fashion and sent to the following stage (a Dadda Treee adder).
//					Another output "signs" forwards the MSB of each triplet to indicate when
//					a subtraction must be performed at the Dadda Tree level.
//					
/*----------------------------------------------------------------------------------------------------*/


module booth(A, B, PP1, PP2, PP3, PP4, PP5, PP6, signs);

import booth_pkg::*;

	/*------------------------------ PORT*/
	input [numbit-1:0] A;
	input [numbit-1:0] B;

	/*------------------------------ CONNECTIONS*/
	output logic [numbit:0]		PP1;
	output logic [numbit:0]		PP2;
	output logic [numbit:0]		PP3;
	output logic [numbit:0]		PP4;
	output logic [numbit:0]		PP5;
	output logic [numbit-1:0]	PP6;
	output [ 4:0] signs;
	
	logic [numbit+1:-1] B_int;

	// B MSB is extended: B[11] and B[10]
	// B LSB is extended: B[-1]
	assign B_int = {2'b0, B, 1'b0};

	// Sign vector to perform CA2 subtraction in Dadda tree
	assign signs = {B[9], B[7], B[5], B[3], B[1]};

	/*******************************
	*   Modified Booth encodings:
	*   
	*   000  ->    0
	*   001  ->    A
	*   010  ->    A
	*   011  ->   2A
	*   100  ->  -2A
	*   101  ->   -A
	*   110  ->   -A
	*   111  ->    0
	*   
	*******************************/

	always_comb begin
		case (B_int[1:-1])
			3'b000 : PP1 =  11'b0;
			3'b001 : PP1 =  {1'b0, A};
			3'b010 : PP1 =  {1'b0, A};
			3'b011 : PP1 =  {A, 1'b0};
			3'b100 : PP1 = ~{A, 1'b0};
			3'b101 : PP1 = ~{1'b0, A};
			3'b110 : PP1 = ~{1'b0, A};
			3'b111 : PP1 = ~11'b0;
		endcase

		case (B_int[3:1])
			3'b000 : PP2 =  11'b0;
			3'b001 : PP2 =  {1'b0, A};
			3'b010 : PP2 =  {1'b0, A};
			3'b011 : PP2 =  {A, 1'b0};
			3'b100 : PP2 = ~{A, 1'b0};
			3'b101 : PP2 = ~{1'b0, A};
			3'b110 : PP2 = ~{1'b0, A};
			3'b111 : PP2 = ~11'b0;
		endcase

		case (B_int[5:3])
			3'b000 : PP3 =  11'b0;
			3'b001 : PP3 =  {1'b0, A};
			3'b010 : PP3 =  {1'b0, A};
			3'b011 : PP3 =  {A, 1'b0};
			3'b100 : PP3 = ~{A, 1'b0};
			3'b101 : PP3 = ~{1'b0, A};
			3'b110 : PP3 = ~{1'b0, A};
			3'b111 : PP3 = ~11'b0;
		endcase

		case (B_int[7:5])
			3'b000 : PP4 =  11'b0;
			3'b001 : PP4 =  {1'b0, A};
			3'b010 : PP4 =  {1'b0, A};
			3'b011 : PP4 =  {A, 1'b0};
			3'b100 : PP4 = ~{A, 1'b0};
			3'b101 : PP4 = ~{1'b0, A};
			3'b110 : PP4 = ~{1'b0, A};
			3'b111 : PP4 = ~11'b0;
		endcase

		case (B_int[9:7])
			3'b000 : PP5 =  11'b0;
			3'b001 : PP5 =  {1'b0, A};
			3'b010 : PP5 =  {1'b0, A};
			3'b011 : PP5 =  {A, 1'b0};
			3'b100 : PP5 = ~{A, 1'b0};
			3'b101 : PP5 = ~{1'b0, A};
			3'b110 : PP5 = ~{1'b0, A};
			3'b111 : PP5 = ~11'b0;
		endcase

		case (B_int[11:9])
			3'b000 : PP6 = 10'b0;
			3'b001 : PP6 = A;
		endcase
	end



endmodule
