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
// File: alu_wrap.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_wrap.sv
 * ----------------------------------------
 * A simple wrapper to use the interface defined in 'alu_if.sv' 
 * instead of direct port mapping. This component also allows to
 * connect the interface to a VHDL DUT (compiled separately).
 */

module alu_wrap #(parameter DWIDTH = 32) (
	alu_if.alu_port p
);
	parameter fpnew_pkg::fpu_features_t       Features       = fpnew_pkg::RV16F;   
	parameter fpnew_pkg::fpu_implementation_t Implementation = fpnew_pkg::ISA_PIPE;
	parameter type                            TagType        = logic;
	localparam int unsigned WIDTH        = Features.Width;
	localparam int unsigned NUM_OPERANDS = 3;
	
	wire [NUM_OPERANDS-1:0][WIDTH-1:0] operands_i;
	var fpnew_pkg::roundmode_e rnd_mode_i;
	var fpnew_pkg::operation_e op_i;
	var logic op_mod_i;
	var fpnew_pkg::fp_format_e src_fmt_i;
	var fpnew_pkg::fp_format_e dst_fmt_i;
	var fpnew_pkg::int_format_e int_fmt_i;
	var logic vectorial_op_i;
	var TagType tag_i;
	wire in_valid_i;
	wire in_ready_o;
	var logic flush_i;
	wire [WIDTH-1:0] result_o;
	var fpnew_pkg::status_t status_o;
	wire tag_o;
	wire out_valid_o;
	var logic out_ready_i;
	wire busy_o;
	wire end_sim;

	assign rnd_mode_i = fpnew_pkg::RNE;
	assign src_fmt_i = fpnew_pkg::FP16;
	assign dst_fmt_i = fpnew_pkg::FP16;
	assign int_fmt_i = fpnew_pkg::INT16;   
	assign vectorial_op_i = 0;
	assign tag_i = 0;
	assign flush_i = 0;
	assign op_mod_i = 0;
	assign out_ready_i = out_valid_o;
	assign operands_i[0] = p.alu_a;    
	assign operands_i[1] = p.alu_b;    
	assign operands_i[2] = p.alu_c;

	always_comb begin
		case (p.alu_op)
			//alu_pkg::FMADD: op_i = fpnew_pkg::FMADD;
			//alu_pkg::FNMSUB: op_i = fpnew_pkg::FNMSUB;
			alu_pkg::ADD: op_i = fpnew_pkg::ADD;
			alu_pkg::MUL: op_i = fpnew_pkg::MUL;

			default: op_i = fpnew_pkg::MUL; // Default case
		endcase
	end


	fpnew_top fpnew_top_u (
		.clk_i(p.clk),
		.rst_ni(p.rst_n),
		// Input signals
		.operands_i(operands_i),
		.rnd_mode_i(rnd_mode_i),
		.op_i(op_i),
		.op_mod_i(op_mod_i),
		.src_fmt_i(src_fmt_i),
		.dst_fmt_i(dst_fmt_i),
		.int_fmt_i(int_fmt_i),
		.vectorial_op_i(vectorial_op_i),
		.tag_i(tag_i),
		// Input Handshake
		.in_valid_i(p.valid),
		.in_ready_o(in_ready_o),
		.flush_i(flush_i),
		// Output signals
		.result_o(p.alu_res),
		.status_o(status_o),
		.tag_o(tag_o),
		// Output handshake
		.out_valid_o(out_valid_o),
		.out_ready_i(out_ready_i),
		// Indication of valid data in flight
		.busy_o(busy_o)
	);

endmodule
