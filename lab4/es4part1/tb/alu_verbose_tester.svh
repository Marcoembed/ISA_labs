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
// File: alu_verbose_tester.svh
// Author: Michele Caon
// Date: 02/06/2022

// File: alu_verbose_tester.svh
// ----------------------------
// Class extended from alu_tester.svh to print additional information about
// the test progress.

`ifndef ALU_VERBOSE_TESTER_SVH_
`define ALU_VERBOSE_TESTER_SVH_

`include "alu_tester.svh"

/* ALU verbose tester class */
class alu_verbose_tester #(
    parameter DWIDTH    = 32
) extends alu_tester #(DWIDTH);    // inherits methods and variables from alu_tester

    // Operands queue
    op_t    opq[$];
    
    // Use the constructor from the parent class
    function new(virtual interface alu_if #(DWIDTH) _if);
        super.new(_if);
        opq = {};
    endfunction // new()

    // Test body
    task run_test(int unsigned num_cycles);
        // Reset the DUT
        init();

        // Start measuring coverage
        acov.cov_start();

        fork
            // Monitor operations
            print_op();

            // Issue num_cycles random ALU operations
            repeat (num_cycles) begin: driver
                @(posedge taif.clk);
                rand_alu_op();
                opq.push_front({alu_op});
            end
        join

        // Stop measuring coverage
        acov.cov_stop();
    endtask // run_test()
    
    // Print current operation
    task print_op();
        op_t   prev_op;

        repeat (2) @(negedge taif.clk);    // skip the first result after reset
        while (opq.size() > 0) begin
            @(negedge taif.clk); // sample on negative edge to avoid race conditions
            prev_op = opq.pop_back();
            $display("[%07t] %-8s | a: %b (%d) | b: %b (%d) | res: %b (%d)", $time, prev_op.op, prev_op.a, prev_op.a, prev_op.b, prev_op.b, taif.alu_res, taif.alu_res);
        end
    endtask // op2str()

endclass // alu_verbose_tester

`endif /* ALU_VERBOSE_TESTER_SVH_ */
