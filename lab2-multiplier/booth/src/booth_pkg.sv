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
		parameter numbit	= 10;			// multiplier parallelism
		parameter pp_width	= numbit+1;		// partial products parallelism
		parameter pp_deep	= 6;			// partial prodcuts number
		parameter level		= 2;			// number of iteration levels
endpackage