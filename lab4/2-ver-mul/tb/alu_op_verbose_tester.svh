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
// File: alu_op_verbose_tester.svh
// Author: Michele Caon
// Date: 02/06/2022

`ifndef ALU_OP_VERBOSE_TESTER_SVH_
`define ALU_OP_VERBOSE_TESTER_SVH_

`include "alu_verbose_tester.svh"

/* ALU verbose tester class (one operation only) */
class alu_op_verbose_tester #(
    parameter DWIDTH    = 32
) extends alu_verbose_tester #(DWIDTH);    // inherits methods and variables from alu_verbose_tester

    // ALU operation
    alu_op_t    req_op = ADD;
    
    // Use the constructor from the parent class
    function new(virtual interface alu_if #(DWIDTH) _if, alu_op_t _op);
        super.new(_if);
        req_op = _op;
    endfunction // new()

    // Add a constraint on the randomization of 'alu_op' to only generate the specified ALU operation
    constraint and_only_c {
        alu_op.op == req_op;
    };

endclass // alu_op_verbose_tester

`endif /* ALU_OP_VERBOSE_TESTER_SVH_ */