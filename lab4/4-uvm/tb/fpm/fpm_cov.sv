class fpm_cov extends uvm_subscriber # (packet_in);
	`uvm_component_utils(fpm_cov)

	packet_in p_in;

	covergroup fpm_cg;

		operations: coverpoint p_in.op {
            bins add        = {ADD};
            bins mult       = {MUL};
            // bins fmadd      = {FMADD};
            // bins fnmsub     = {FNMSUB};
		}

		operand_A: coverpoint p_in.A {
			bins A_zero[2] = {16'b0000000000000000, 16'b1000000000000000}; // {0, -0}
			bins A_nan[2] = {[16'b1111110000000001:16'b1111111111111111], [16'b0111110000000001:16'b0111111111111111]}; // {-nan range, +nan range}
			bins A_inf[2] = {16'b1111110000000000, 16'b0111110000000000}; // {-inf, +inf}
			bins A_others = default;
			
		}

		operand_B: coverpoint p_in.B {
			bins B_zero[2] = {16'b0000000000000000, 16'b1000000000000000}; // {0, -0}
			bins B_nan[2] = {[16'b1111110000000001:16'b1111111111111111],[16'b0111110000000001:16'b0111111111111111]}; // {-nan range, +nan range}
			bins B_inf[2] = {16'b1111110000000000, 16'b0111110000000000}; // {-inf, +inf}
			bins B_others = default;
		}

		operand_C: coverpoint p_in.C {
			bins C_zero[2] = {16'b0000000000000000, 16'b1000000000000000}; // {0, -0}
			bins C_nan[2] = {[16'b1111110000000001:16'b1111111111111111],[16'b0111110000000001:16'b0111111111111111]}; // {-nan range, +nan range}
			bins C_inf[2] = {16'b1111110000000000, 16'b0111110000000000}; // {-inf, +inf}
			bins C_others = default;
		}

		cross_A_B: cross operand_A, operand_B, operations {
			ignore_bins ig_add = binsof(operations.add);
		}

		cross_B_C: cross operand_A, operand_B, operations {
			ignore_bins ig_add = binsof(operations.mult);
		}

	endgroup: fpm_cg;

	// Constructor
    function new( string name , uvm_component parent);
        super.new( name , parent );
        fpm_cg = new();
    endfunction

	function void write(packet_in t);
		real cov;
		p_in = t; // pass packet 
		fpm_cg.sample(); // covergroup sample
		cov = $get_coverage();
        `uvm_info("\n--- COVERAGE ---\n",$sformatf("Coverage = %f%%", cov), UVM_MEDIUM);
	endfunction

endclass
