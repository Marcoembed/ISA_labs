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
// File: alu_if_sva.svh
// Author: Michele Caon
// Date: 02/06/2022

// SystemVerilog Assertions
// ------------------------
// Assertions to verify that the ALU is producing the correct result.

`ifndef ALU_IF_SVA_SVH_
`define ALU_IF_SVA_SVH_

// Importing C functions in systemverilog using DPI-C
import "DPI-C" context function int mul_FP16(int a, int b);

// Print operation
`define PRINT_OP(op, a, b, res) \
    $sformatf("op: %-7s | a: %016b (0x%04h) | b: %016b (0x%04h) | res_HW: %016b (0x%04h)\n", op, $past(a, 2), $past(a, 2), $past(b, 2), $past(b, 2), res, res)



/* MULT and SHIFT bitwidths */
localparam      SHIFT_WIDTH = $clog2(DWIDTH);
localparam      MULT_WIDTH  = DWIDTH/2;

// Wrong results
int unsigned    err_num = 0;

// Get the number of errors and reset
function int unsigned get_err_num();
    automatic int unsigned n = err_num;
    err_num = 0;
    return n;
endfunction: get_err_num

// Reset condition
// ---------------
// Check that whenever the reset signal is asserted, the output is 0.
property p_reset;
    @(posedge clk or negedge rst_n)
    !rst_n |-> alu_res == 'h0;
endproperty
a_reset: assert property (p_reset);

// ALU result
// ----------
// Check that the correct result is produced one clock cycle after
// receiving the input operands and the requested ALU operation.

property p_result;
    logic [DWIDTH-1:0] res;
    @(negedge clk) disable iff (!rst_n)
    case (alu_op)
        /* Arithemtic operations */
        ADD:        ##1 alu_res == alu_a + alu_b;
        SUB:        ##1 alu_res == alu_a - alu_b;
        MULT:       ##1 alu_res == mul_FP16($past(alu_a, 2), $past(alu_b, 2)); 


        /* With other operations, return 0 */
        default:    ##1 alu_res == 'h0;
    endcase
endproperty
a_result: assert property (p_result) 
else begin
    err_num++;
    $error("%s", `PRINT_OP(alu_op, alu_a, alu_b, alu_res));
    $display("HW\t0b%016b (0x%04h)", alu_res, alu_res);
end

`endif /* ALU_IF_SVA_SVH_ */
