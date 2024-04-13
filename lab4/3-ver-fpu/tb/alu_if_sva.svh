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

// Print operation
`define PRINT_OP(op, a, b, res) \
    $sformatf("op: %-7s | a: %011b (%d) | b: %011b (%d) | res: %011b (%d)", (op), $past(a, 2), $past(a, 2), $past(b, 2), $past(b, 2), res, res)

//functions
function shortreal to_shortreal(input logic [15:0] value);
// Function to decode IEEE 754 half-precision float

    shortreal result;
    automatic logic sign = value[15];
    automatic logic [5-1:0] exponent = value[14:10];
    automatic logic [10-1:0] fraction = value[9:0];
    automatic int exp = $signed(exponent) - 127;
    automatic logic [10:0] significand;

    // Append implicit leading 1 to the fraction
    significand = {1'b1, fraction};

    // Convert significand and exponent to real
    result = ($signed(sign) == 1) ? -1.0 : 1.0;
    result *= 2 ** exp;
    result *= $itor(significand) / 2 ** 10;

    $display("%b", value);
    return result;
endfunction

function logic[15:0] to_FP16(input shortreal value);
// Function to encode IEEE 754 half-precision float

    logic[31:0] value_32;
    logic[15:0] result;

    value_32 = $shortrealtobits(value);
    result = {value_32[31:30], value_32[26:23], value_32[22:13]};

    return result;
endfunction

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
        ADD:        ##1 alu_res == to_FP16(to_shortreal(alu_a) + to_shortreal(alu_b));
        SUB:        ##1 alu_res == to_FP16(to_shortreal(alu_a) - to_shortreal(alu_b));
        MULT:       ##1 alu_res == to_FP16(to_shortreal(alu_a) * to_shortreal(alu_b)); 
        
        /* Bitwise operations */
        BITAND:     ##1 alu_res == (alu_a & alu_b);
        BITOR:      ##1 alu_res == (alu_a | alu_b);
        BITXOR:     ##1 alu_res == (alu_a ^ alu_b);
        
        /* Logical shift operations */
        FUNCLSL:    ##1 alu_res == (alu_a << alu_b[SHIFT_WIDTH-1:0]);
        FUNCLSR:    ##1 alu_res == (alu_a >> alu_b[SHIFT_WIDTH-1:0]);

        /* Rotate operations */
        FUNCRL:
            (1, res = alu_a << alu_b[SHIFT_WIDTH-1:0]) ##0
            (1, res |= alu_a >> (DWIDTH - alu_b[SHIFT_WIDTH-1:0])) ##1
            alu_res == res;

        FUNCRR:
            (1, res = alu_a >> alu_b[SHIFT_WIDTH-1:0]) ##0
            (1, res |= alu_a << (DWIDTH - alu_b[SHIFT_WIDTH-1:0])) ##1
            alu_res == res;

        /* With other operations, return 0 */
        default:    ##1 alu_res == 'h0;
    endcase
endproperty
a_result: assert property (p_result) 
else begin
    err_num++;
    $error("%s", `PRINT_OP(alu_op, alu_a, alu_b, alu_res));
end

`endif /* ALU_IF_SVA_SVH_ */
