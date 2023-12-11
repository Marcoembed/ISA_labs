module multiplier (a, b, out);

	import booth_pkg::*;

	input [pp_width-2:0] a;
	input [pp_width-2:0] b;
	output [2*(pp_width-1)-1:0] out;

	/*------------------------------ SIGNALS*/
	wire [pp_width-1:0] pp1, pp2, pp3, pp4, pp5;
	wire [pp_width-2:0] pp6;
	wire [pp_deep-2:0] signs;
	wire [2*(pp_width-1)-1:0] dadda_A, dadda_B;

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
