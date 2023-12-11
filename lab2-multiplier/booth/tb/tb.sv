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
	

	// Generate stimulus
	initial begin
		// Initial values
		TB_A = 10'b0000000000;
		TB_B = 10'b1111111111;
		
		// Simulate for 500ns = 50 * 10ns
		repeat (50) begin

			// Wait for 10ns
			#10ns;

			// Assert values
			$display("################################");
			$display("Time =  %0t ns:", ($time-10ns)/1000);
			$display("A =     %20b  (%0d)", TB_A, TB_A);
			$display("B =     %20b  (%0d)", TB_B, TB_B);
			$display("OUT =   %20b  (%0d)", TB_out, TB_out);

			// Drive random values to the signals
			TB_A = $random;
			TB_B = $random;

		end
		
		// Stop simulation
		$stop;
	end
endmodule
