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
// File: alu.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu.sv
 * ----------------------------------------
 * Simple parameterized ALU with output register (1-cycle
 * latency).
 */

/* Import ALU package namespace (to be compiled before this file) */
import alu_pkg::*;

/* Combinational ALU */
module alu 
#(
    parameter DWIDTH = 32   // instantiate 32-bit version if not specified
) (
    input   logic               clk_i,
    input   logic               rst_n_i,
    input   alu_op_t            alu_op_i,
    input   logic [DWIDTH-1:0]  alu_a_i,
    input   logic [DWIDTH-1:0]  alu_b_i,
    output  logic [DWIDTH-1:0]  alu_res_o
);
    /* MULT and SHIFT bitwidths */
    localparam      SHIFT_WIDTH = $clog2(DWIDTH);
    localparam      MULT_WIDTH  = DWIDTH/2;

    /* Internal result */
    logic [DWIDTH-1:0]  res;

    /* Combinational ALU logic */
    always_comb begin : alu_logic
        case (alu_op_i)
            /* Arithemtic operations */
            ADD:        res     = alu_a_i + alu_b_i;
            SUB:        res     = alu_a_i - alu_b_i;
            MULT:       res     = alu_a_i[MULT_WIDTH-1:0] * alu_b_i[MULT_WIDTH-1:0];  // no saturation (only DWITH/2 operands supported) 
            
            /* Bitwise operations */
            BITAND:     res     = alu_a_i & alu_b_i;
            BITOR:      res     = alu_a_i | alu_b_i;
            BITXOR:     res     = alu_a_i ^ alu_b_i;
            
            /* Logical shift operations */
            FUNCLSL:    res     = alu_a_i << alu_b_i[SHIFT_WIDTH-1:0];
            FUNCLSR:    res     = alu_a_i >> alu_b_i[SHIFT_WIDTH-1:0];

            /* Rotate operations */
            FUNCRL:     begin
                res     = alu_a_i << alu_b_i[SHIFT_WIDTH-1:0];
                res     |= alu_a_i >> (DWIDTH - alu_b_i[SHIFT_WIDTH-1:0]);
            end
            FUNCRR:     begin
                res     = alu_a_i >> alu_b_i[SHIFT_WIDTH-1:0];
                res     |= alu_a_i << (DWIDTH - alu_b_i[SHIFT_WIDTH-1:0]);
            end

            /* With other operations, return 0 */
            default:    res     = 'h0;
        endcase
    end

    /* Output register */
    always_ff @(posedge clk_i or negedge rst_n_i) begin : alu_out_reg
        if (!rst_n_i) begin
            alu_res_o   <= 'd0;
        end else begin
            alu_res_o   <= res;
        end
    end
endmodule