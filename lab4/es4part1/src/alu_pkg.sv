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
// File: alu_pkg.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_pkg.sv
 * ----------------------------------------
 * Type definitions for the ALU described in 'alu.sv'
 */

`ifndef ALU_PKG_SV_
`define ALU_PKG_SV_

/* ALU operation data type */
package alu_pkg;
    typedef enum logic[3:0] { 
        ADD, 
        SUB, 
        MULT, 
        BITAND, 
        BITOR, 
        BITXOR, 
        FUNCLSL, 
        FUNCLSR, 
        FUNCRL, 
        FUNCRR
    } alu_op_t;
endpackage

`endif /* ALU_PKG_SV_ */