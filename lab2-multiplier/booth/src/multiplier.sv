/*-------------------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name:		Multiplier (Modified radix 4 Booth encoder + Dadda Tree adder)
// Project Name:	BOOTH
// Description:		The multiplier module can be seen as the top level entity that
//					performs an unsigned multiplicaton on two operands A and B 
//					providing a double-sized product OUT.
//					From an high level perspective, it forwards A and B to the 
//					encoder, connecting its partial products with the Dadda Tree adder.
//					Its outputs are collected and summed (here with a behavioural description),
//					but a third module as well could be used for the final sum.
//					
/*-------------------------------------------------------------------------------------------------*/


module multiplier (a, b, out);

	import booth_pkg::*;

	input [numbit-1:0]		a;
	input [numbit-1:0]		b;
	output [2*numbit-1:0]	out;

	/*------------------------------ SIGNALS*/
	wire [numbit:0] pp1, pp2, pp3, pp4, pp5;
	wire [numbit-1:0] pp6;
	wire [pp_deep-2:0] signs;
	wire [2*numbit-1:0] dadda_A, dadda_B;

	booth booth(
		.A(a),
		.B(b),
		.PP1(pp1),	
		.PP2(pp2),	
		.PP3(pp3),	
		.PP4(pp4),	
		.PP5(pp5),	
		.PP6(pp6),	
		.signs(signs)
	);

	dadda dadda(
		.pp1(pp1),
		.pp2(pp2),
		.pp3(pp3),
		.pp4(pp4),
		.pp5(pp5),
		.pp6(pp6),
		.signs(signs),
		.outA(dadda_A),
		.outB(dadda_B)
	);

	assign out = dadda_A + dadda_B;	

endmodule
