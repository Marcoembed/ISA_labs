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
// File: alu_cov.svh
// Author: Michele Caon
// Date: 06/06/2022

// File: alu_cov.svh
// ----------------------------------------
// Classes containig the methods and covergroup to compute the functional
// coverage of the ALU.

`ifndef ALU_COV_SVH_
`define ALU_COV_SVH_

import alu_pkg::*;

class alu_cov #(
    parameter DWIDTH = 8
);
    // ---------
    // VARIABLES
    // ---------
    
    // Adder interface
    local virtual interface alu_if #(DWIDTH) aif;
    
    // -------------------
    // FUNCTIONAL COVERAGE
    // -------------------

    // ALU coverage
    covergroup alu_cg;
        // Operations
        op_cp: coverpoint aif.alu_op iff (aif.rst_n) {
            bins add        = {ADD};
            bins sub        = {SUB};
            bins mult       = {MULT};
            bins bitand     = {BITAND};
            bins bitor      = {BITOR};
            bins bitxor     = {BITXOR};
            bins funclsl    = {FUNCLSL};
            bins funclsr    = {FUNCLSR};
            bins funcrl     = {FUNCRL};
            bins funcrr     = {FUNCRR};
        }

        // Operands
        a_cp: coverpoint aif.alu_a iff (aif.rst_n) {
            bins corner[]   = {0, (1<<DWIDTH)-1, (1<<(DWIDTH-1))-1};
            bins others     = default;
        }
        b_cp: coverpoint aif.alu_b iff (aif.rst_n) {
            bins corner[]   = {0, (1<<DWIDTH)-1, (1<<(DWIDTH-1))-1};
            bins others     = default;
        }
    endgroup: alu_cg

    // -------
    // METHODS
    // -------

    // Constructor
    function new(virtual interface alu_if #(DWIDTH) _if);
        aif         = _if;
        alu_cg      = new();

        // disable the covergroup by default
        alu_cg.stop();
    endfunction: new

    // Enable operands coverage
    function void cov_start();
        alu_cg.start();
    endfunction: cov_start

    // Disable operands coverage
    function void cov_stop();
        alu_cg.stop();
    endfunction: cov_stop

    // Sample operands coverage
    function void cov_sample();
        alu_cg.sample();
    endfunction: cov_sample

    // Return operands coverage
    function real get_cov();
        return alu_cg.get_inst_coverage();
    endfunction: get_cov
    
endclass // alu_cov

`endif /* ALU_COV_SVH_ */