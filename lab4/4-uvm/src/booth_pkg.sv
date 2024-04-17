/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name:		Booth Package
// Project Name:	BOOTH
// Description:		Set of main constants used for the project
//
/*--------------------------------------------------------------------------------*/


package booth_pkg;
		localparam numbit	= 11;			// multiplier parallelism
		localparam pp_width	= numbit+1;		// partial products parallelism
		localparam pp_deep	= 6;			// partial prodcuts number
		localparam level	= 2;			// number of iteration levels
endpackage
