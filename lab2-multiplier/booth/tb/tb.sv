/*----------------------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name:		TestBench
// Project Name:	BOOTH
// Description:		The TestBench serves as a verification tool for the standalone
//					multiplier entity. For this project an exaustive approach was
//					chosen since the total number of combinations to test was still
//					manageable. Thus, the TestBench creates every possible combination
//					for inputs A and B and chechs the output product against the 
//					software-computed value, collecting the number of occurring divergences.
//					At the end a scoreboard is prompted to have a quick check of
//					the correctness of the multiplier.
//					
/*----------------------------------------------------------------------------------------------*/


module tb;
	// Declare signals
	logic [ 9:0] TB_A, TB_B;
	logic [19:0] TB_out;
	
	// Instantiate DUT (Design Under Test)
	multiplier dut (
		.a(TB_A),
		.b(TB_B),
		.out(TB_out)
	);
	
	int z, errors = 0;
	//const int MAXINT = 2**3-1;
	const int MAXINT = 2**10-1;

	// Generate stimuli
	initial begin

		// Exaustive loops for all possible cases
		for(int x=0; x<=MAXINT; x++) begin
			for(int y=0; y<=MAXINT; y++) begin

				// Drive input signals
				TB_A = x;
				TB_B = y;
				z = x*y;

				// Wait for 10ns
				#10ns;

				// Assert values
				//$display("################################");
				//$display("A =              %7d", TB_A);
				//$display("B =              %7d", TB_B);
				//$display("OUT (HW) =       %7d", TB_out);
				//$display("OUT (expected) = %7d", z);

				if(TB_out != z) begin
					errors ++;
				end

			end
		end

		$display("\n\n################################\n");
		$display("Operations checked: %7d", (MAXINT+1)**2);
		$display("Mismatches found:   %7d", errors);
		$display("\n################################\n\n");
		
		// Stop simulation
		$stop;
	end
endmodule