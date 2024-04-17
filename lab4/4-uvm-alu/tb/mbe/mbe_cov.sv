class mbe_cov extends uvm_subscriber # (packet_in);
	`uvm_component_utils(mbe_cov)

	packet_in p_in;

	covergroup mbe_cg;

		operand_A: coverpoint p_in.A {
			bins A_zero[2] = {11'b00000000000};
			bins A_max[2] = {11'b11111111111};
			bins A_others = default;
			
		}

		operand_B: coverpoint p_in.B {
			bins B_zero[2] = {11'b00000000000};
			bins B_max[2] = {11'b11111111111};
			bins B_others = default;
		}

	endgroup: mbe_cg;

	// Constructor
    function new( string name , uvm_component parent);
        super.new( name , parent );
        mbe_cg = new();
    endfunction

	function void write(packet_in t);
		real cov;
		p_in = t; // pass packet 
		mbe_cg.sample(); // covergroup sample
		cov = $get_coverage();
        `uvm_info("\n--- COVERAGE ---\n",$sformatf("Coverage = %f%%", cov), UVM_MEDIUM);
	endfunction

endclass
