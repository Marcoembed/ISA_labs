// Copyright 2022 Politecnico di Torino.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-2.0. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// File: alu_tester.svh
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_tester.svh
 * ----------------------------------------
 * Class containig the methods and variables to test the
 * ALU described in 'alu.sv' using the interface in 
 * 'alu_if.sv'.
 */

`ifndef ALU_TESTER_SVH_
`define ALU_TESTER_SVH_

`include "alu_cov.svh"

import fpnew_pkg::*;

/* ALU tester class */
class alu_tester #(
	parameter DWIDTH    = 16
);
	// PROPERTIES
	// ----------

	// ALU interface
	/*
	 * NOTE: the interface is declared as virtual, meaning that the
	 * user will provide a proper implementation. In this case, the 
	 * handle to a proper interface object is passed to the 
	 * constructor (see below) by the TB in 'alu_tb.sv'.
	 */
	virtual interface alu_if #(DWIDTH) taif;

	// Random ALU operation and inputs (updated by the 'randomize()' method)
	typedef struct packed {
		operation_e         op;
		logic [DWIDTH-1:0]  a;
		logic [DWIDTH-1:0]  b;
		logic [DWIDTH-1:0]  c;
	} op_t;
	protected rand op_t     alu_op;

	// Constraint to prefer corner cases for operands /10x more likely)
	constraint ab_dist_c {
		alu_op.a dist {
			16'b0000000000000000              :=16, // +zero case
			16'b1000000000000000              :=16, // -zero case
			[16'b0000000000000001:16'b0111101111111111]    :/30, // positive normal number
			[16'b1000000000000001:16'b1111101111111111]    :/30, // negative normal number
			[16'b1111110000000001:16'b1111111111111111]    :/16, //-nan
			[16'b0111110000000001:16'b0111111111111111]    :/16, //+nan
			16'b1111110000000000        :=16, // -inf
			16'b0111110000000000        :=16  // +inf
		};
		alu_op.b dist {
			16'b0000000000000000              :=16, // +zero case
			16'b1000000000000000              :=16, // -zero case
			[16'b0000000000000001:16'b0111101111111111]    :/30, // positive normal number
			[16'b1000000000000001:16'b1111101111111111]    :/30, // negative normal number
			[16'b1111110000000001:16'b1111111111111111]    :/16, //-nan
			[16'b0111110000000001:16'b0111111111111111]    :/16, //+nan
			16'b1111110000000000        :=16, // -inf
			16'b0111110000000000        :=16  // +inf
		};
		alu_op.c dist {
			16'b0000000000000000              :=16, // +zero case
			16'b1000000000000000              :=16, // -zero case
			[16'b0000000000000001:16'b0111101111111111]    :/30, // positive normal number
			[16'b1000000000000001:16'b1111101111111111]    :/30, // negative normal number
			[16'b1111110000000001:16'b1111111111111111]    :/16, //-nan
			[16'b0111110000000001:16'b0111111111111111]    :/16, //+nan
			16'b1111110000000000        :=16, // -inf
			16'b0111110000000000        :=16  // +inf
		};
	};

	constraint op_constr {
		alu_op.op == ADD || alu_op.op == MUL;
	};

	// ALU coverage
	// NOTE: declared as static so it's shared among multiple class
	// instances.
	protected static alu_cov #(DWIDTH)  acov;

	// METHODS
	// -------

	// Constructor
	function new(virtual interface alu_if #(DWIDTH) _if);
		taif = _if;   // get the handle to the ALU interface from the TB
		acov = new(_if);
	endfunction // new()

	// Test body
	/*
	 * NOTE: tasks can contain "time-consuming" code, while functions
	 * are always executed within a single simulation step.
	 */
	task run_test(int unsigned num_cycles);
		// Reset the DUT
		init();

		// Start measuring coverage
		acov.cov_start();

		// Issue num_cycles random ALU operations
		repeat (num_cycles) begin: driver
			@(posedge taif.clk);
			rand_alu_op();
			taif.valid = '1;
		 end

		// Wait for the last operation to complete
		@(posedge taif.clk);

		taif.valid = '0;
		// Stop measuring coverage
		acov.cov_stop();
	endtask // run_test()

	protected task init();
		// Reset driver signals
		taif.alu_a      = '0;
		taif.alu_b      = '0;
		taif.alu_c      = '0;
		taif.alu_op     = MUL;
		taif.valid = '0;

		// Reset the DUT
		taif.rst_dut();

		@(posedge taif.clk);
	endtask: init
	
	// Prepare a new ALU operation
	function void rand_alu_op();
		// Obtain random operations and operands
		assert (this.randomize())   // check the method's return value
		else   $error("ERROR while calling 'randomize()' method");

		// Set the ALU interface signals
		taif.alu_op   = alu_op.op;
		taif.alu_a    = alu_op.a;
		taif.alu_b    = alu_op.b;
		taif.alu_c    = alu_op.c;

		// Update coverage
		acov.cov_sample();
	endfunction

	// Get the ALU coverage
	function real get_cov();
		return acov.get_cov();
	endfunction: get_cov

endclass // alu_tester

`endif /* ALU_TESTER_SVH_ */


