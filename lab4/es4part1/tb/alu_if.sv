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
// File: alu_if.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_if.sv
 * ----------------------------------------
 * Interface with the ALU wrapper in 'alu_wrap.sv'.
 */

import alu_pkg::*;  // for alu_op_t

interface alu_if #(parameter DWIDTH = 32);

    /* INTERFACE SIGNALS */
    logic               clk;
    logic               rst_n;
    alu_op_t            alu_op;
    logic [DWIDTH-1:0]  alu_a;
    logic [DWIDTH-1:0]  alu_b;
    logic [DWIDTH-1:0]  alu_res;

    /* INTERFACE SIGNALS MODE MAPPING */

    /* Interface port at ALU side (DUT) */
    modport alu_port (
        input   clk,
        input   rst_n,
        input   alu_op,
        input   alu_a,
        input   alu_b,
        output  alu_res
    );

    /* Interface port at driver side (unused since the driver is a class) */
    modport driver_port (
        input   clk,
        input   rst_n,
        output  alu_op,
        output  alu_a,
        output  alu_b,
        input   alu_res
    );

    /*
     * NOTE: an interface can be used to abstract the communication
     * with a module and to implement self-checking functions. In 
     * this case, we use it to generate the clock for the sequential
     * ALU and to check that the result is consistent with the input.
     */

    /******************************************************************************/
    /* CLOCK GENERATION */

    // Initialize clock and reset
    initial begin: init
        clk     = 1'b1;
        rst_n   = 1'b1;
    end

    // Generate clock
    always #5ns begin: clk_gen
        clk = ~clk;
    end

    // Reset the DUT
    task rst_dut();
        @(negedge clk);
        rst_n   = 1'b0;
        @(negedge clk);
        rst_n   = 1'b1;
    endtask // rst_dut

    // ----------
    // ASSERTIONS
    // ----------
    `ifndef SYNTHESIS
    `include "alu_if_sva.svh"
    `endif /* SYNTHESIS */

endinterface // alu_if