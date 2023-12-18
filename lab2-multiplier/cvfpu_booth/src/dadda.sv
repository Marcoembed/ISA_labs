/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name:		Dadda (Dadda Tree adder)
// Project Name:	BOOTH
// Description:		This module recieves partial products from the Booth encoder
//					and adds them all together according to the Dadda Tree structure.
//					The architecture relies on some basic entities (FullAdders and
//					HalfAdders) that are instantiated thanks to a specificly written
//					Python script. At the end of the Tree, two operands are sent
//					out to perform the last sum externally.
//					
/*--------------------------------------------------------------------------------*/


module dadda (pp1, pp2, pp3, pp4, pp5, pp6, signs, outA, outB);

import booth_pkg::*;

	/*------------------------------ PORT*/
	input [numbit:0]		pp1;		// 11 bits
	input [numbit:0]		pp2;		// 11 bits
	input [numbit:0]		pp3;		// 11 bits
	input [numbit:0]		pp4;		// 11 bits
	input [numbit:0]		pp5;		// 11 bits
	input [numbit-1:0]		pp6;		// 10 bits
	input [pp_deep-2:0]		signs;		//  6 bits
	output [2*numbit-1:0]	outA;		// 20 bits
	output [2*numbit-1:0]	outB;		// 20 bits
	
	/*------------------------------ CONNECTIONS*/
	wire [level:0][2*numbit:0] s1;
	wire [level:0][2*numbit:0] s2;
	wire [level:0][2*numbit:0] c2;
	wire [level:0][2*numbit:0] c1;


	/*------------------------------ START PORTMAP*/

	HA HA0_6 (pp1[6], pp2[4], s1[0][6], c1[0][7]);
	HA HA0_7 (pp1[7], pp2[5], s1[0][7], c1[0][8]);
	FA FA0_8 (pp1[8], pp2[6], pp3[4], s1[0][8], c1[0][9]);
	HA HA0_8 (pp4[2], pp5[0], s2[0][8], c2[0][9]);
	FA FA0_9 (pp1[9], pp2[7], pp3[5], s1[0][9], c1[0][10]);
	HA HA0_9 (pp4[3], pp5[1], s2[0][9], c2[0][10]);
	FA FA1_0_10 (pp1[10], pp2[8], pp3[6], s1[0][10], c1[0][11]);
	FA FA2_0_10 (pp4[4], pp5[2], pp6[0], s2[0][10], c2[0][11]);
	FA FA1_0_11 (signs[0], pp2[9], pp3[7], s1[0][11], c1[0][12]);
	FA FA2_0_11 (pp4[5], pp5[3], pp6[1], s2[0][11], c2[0][12]);
	FA FA1_0_12 (signs[0], pp2[10], pp3[8], s1[0][12], c1[0][13]);
	FA FA2_0_12 (pp4[6], pp5[4], pp6[2], s2[0][12], c2[0][13]);
	FA FA1_0_13 (~signs[0], ~signs[1], pp3[9], s1[0][13], c1[0][14]);
	FA FA2_0_13 (pp4[7], pp5[5], pp6[3], s2[0][13], c2[0][14]);
	FA FA0_14 (1'b1, pp3[10], pp4[8], s1[0][14], c1[0][15]);
	HA HA0_14 (pp5[6], pp6[4], s2[0][14], c2[0][15]);
	FA FA0_15 (~signs[2], pp4[9], pp5[7], s1[0][15], c1[0][16]);
	HA HA0_16 (1'b1, pp4[10], s1[0][16], c1[0][17]);

	//ITERATION: 0 Goal: 4

	HA HA1_4 (pp1[4], pp2[2], s1[1][4], c1[1][5]);
	HA HA1_5 (pp1[5], pp2[3], s1[1][5], c1[1][6]);
	FA FA1_6 (pp3[2], pp4[0], signs[3], s1[1][6], c1[1][7]);
	FA FA1_7 (pp3[3], pp4[1], c1[0][7], s1[1][7], c1[1][8]);
	FA FA1_8 (signs[4], c1[0][8], s1[0][8], s1[1][8], c1[1][9]);
	FA FA1_9 (c1[0][9], c2[0][9], s1[0][9], s1[1][9], c1[1][10]);
	FA FA1_10 (c1[0][10], c2[0][10], s1[0][10], s1[1][10], c1[1][11]);
	FA FA1_11 (c1[0][11], c2[0][11], s1[0][11], s1[1][11], c1[1][12]);
	FA FA1_12 (c1[0][12], c2[0][12], s1[0][12], s1[1][12], c1[1][13]);
	FA FA1_13 (c1[0][13], c2[0][13], s1[0][13], s1[1][13], c1[1][14]);
	FA FA1_14 (c1[0][14], c2[0][14], s1[0][14], s1[1][14], c1[1][15]);
	FA FA1_15 (pp6[5], c1[0][15], c2[0][15], s1[1][15], c1[1][16]);
	FA FA1_16 (pp5[8], pp6[6], c1[0][16], s1[1][16], c1[1][17]);
	FA FA1_17 (~signs[3], pp5[9], pp6[7], s1[1][17], c1[1][18]);
	HA HA1_18 (1'b1, pp5[10], s1[1][18], c1[1][19]);

	//ITERATION: 1 Goal: 3

	HA HA2_2 (pp1[2], pp2[0], s1[2][2], c1[2][3]);
	HA HA2_3 (pp1[3], pp2[1], s1[2][3], c1[2][4]);
	FA FA2_4 (pp3[0], signs[2], s1[1][4], s1[2][4], c1[2][5]);
	FA FA2_5 (pp3[1], c1[1][5], s1[1][5], s1[2][5], c1[2][6]);
	FA FA2_6 (s1[0][6], c1[1][6], s1[1][6], s1[2][6], c1[2][7]);
	FA FA2_7 (s1[0][7], c1[1][7], s1[1][7], s1[2][7], c1[2][8]);
	FA FA2_8 (s2[0][8], c1[1][8], s1[1][8], s1[2][8], c1[2][9]);
	FA FA2_9 (s2[0][9], c1[1][9], s1[1][9], s1[2][9], c1[2][10]);
	FA FA2_10 (s2[0][10], c1[1][10], s1[1][10], s1[2][10], c1[2][11]);
	FA FA2_11 (s2[0][11], c1[1][11], s1[1][11], s1[2][11], c1[2][12]);
	FA FA2_12 (s2[0][12], c1[1][12], s1[1][12], s1[2][12], c1[2][13]);
	FA FA2_13 (s2[0][13], c1[1][13], s1[1][13], s1[2][13], c1[2][14]);
	FA FA2_14 (s2[0][14], c1[1][14], s1[1][14], s1[2][14], c1[2][15]);
	FA FA2_15 (s1[0][15], c1[1][15], s1[1][15], s1[2][15], c1[2][16]);
	FA FA2_16 (s1[0][16], c1[1][16], s1[1][16], s1[2][16], c1[2][17]);
	FA FA2_17 (c1[0][17], c1[1][17], s1[1][17], s1[2][17], c1[2][18]);
	FA FA2_18 (pp6[8], c1[1][18], s1[1][18], s1[2][18], c1[2][19]);
	FA FA2_19 (~signs[4], pp6[9], c1[1][19], s1[2][19], c1[2][20]);

	//ITERATION: 2 Goal: 2

	/*------------------------------ END PORTMAP*/

	// Generation of the last 2 operands to sum
	assign outA = {c1[2][19:3], signs[1], pp1[1:0]};
	assign outB = {s1[2][19:2], 1'b0, signs[0]};

endmodule
